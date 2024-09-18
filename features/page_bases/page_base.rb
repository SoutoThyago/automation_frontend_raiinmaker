require_relative '../support/report_helper'

class PageBase < SitePrism::Page

    def click(simbolo_elemento)
        eval("wait_until_#{simbolo_elemento}_visible wait:30")
        eval(simbolo_elemento.to_s).click
        ReportHelper.register_event
    end

    def click_without_wait(simbolo_elemento)
        eval(simbolo_elemento.to_s).click
        ReportHelper.register_event
    end

    def double_click(simbolo_elemento)
        wait_visible_element simbolo_elemento
        eval(simbolo_elemento.to_s).double_click
        ReportHelper.register_event
    end

    def send_keys(simbolo_elemento, texto)
        eval("wait_until_#{simbolo_elemento}_visible wait:30")
        eval(simbolo_elemento.to_s).set texto
        ReportHelper.register_event
    end

    def send_keys_sem_espera_por_visibilidade(simbolo_elemento, texto)
        eval(simbolo_elemento.to_s).set texto
        ReportHelper.register_event
    end

    def clear(simbolo_elemento)
        eval(simbolo_elemento.to_s).native.clear
        ReportHelper.register_event
    end

    def mouse_over(simbolo_elemento)
        eval("wait_until_#{simbolo_elemento}_visible wait:30")
        eval(simbolo_elemento.to_s).hover
        ReportHelper.register_event
    end

    def get_text(simbolo_elemento)
        texto = eval(simbolo_elemento.to_s).text
        ReportHelper.register_event
        texto
    end

    def get_value(simbolo_elemento)
        texto = eval(simbolo_elemento.to_s)['value']
        ReportHelper.register_event
        texto
    end

    def get_focus(simbolo_elemento)
        eval(simbolo_elemento.to_s).trigger(:focus)
        ReportHelper.register_event
    end

    def wait_visible_element(simbolo_elemento)
        eval("wait_until_#{simbolo_elemento}_visible")
        ReportHelper.register_event
    end

    def visible_element?(simbolo_elemento)
        sleep 1
        begin
            eval("wait_until_#{simbolo_elemento}_visible")
            return true
        rescue
            return false
        end
    end

    def espera_elemento_invisivel(simbolo_elemento)
        eval("wait_until_#{simbolo_elemento}_invisible")
        ReportHelper.register_event
    end

    def hit_enter(simbolo_elemento)
        eval(simbolo_elemento.to_s).native.send_keys(:return)
        ReportHelper.register_event
    end

    def esperar_elemento_parar simboloElemento, intervalo: 0
        elemento = eval(simboloElemento.to_s)
        posicaoAntiga = -1
        tempoInicial = Time.now
        while (Time.now - tempoInicial) < TIMEOUT_PADRAO.to_f do
            posicao = elemento.evaluate_script("this.getBoundingClientRect().y;")
            if posicao == posicaoAntiga
               break
            else
               posicaoAntiga = posicao
               sleep intervalo
            end
        end
    end

    def scroll_to(simboloElemento)
        eval("wait_until_#{simboloElemento}_visible wait:30")
        script = <<-JS
            arguments[0].scrollIntoView(true);
        JS

        Capybara.current_session.driver.browser.execute_script(script, eval(simboloElemento.to_s).native)
    end

    def esperar_elemento_ter_valor simbolo_elemento, valor_esperado, limite: TIMEOUT_PADRAO.to_f
        eval("wait_until_#{simbolo_elemento}_visible")
        tempoInicial = Time.now
        while (Time.now - tempoInicial) < limite do
            valor_atual = get_value simbolo_elemento
            if valor_atual == valor_esperado
                break
            end
        end
    end

    def esperar_elemento_ter_text(simbolo_elemento, texto_esperado)
        eval("wait_until_#{simbolo_elemento}_visible")
        tempoInicial = Time.now
        while (Time.now - tempoInicial) < TIMEOUT_PADRAO.to_f do
            texto_atual = get_text simbolo_elemento
            if texto_atual == texto_esperado
                break
            end
        end
    end

    def drag_and_drop simbolo_elemento_drag, simbolo_elemento_drop
        eval(simbolo_elemento_drag.to_s).drag_to eval(simbolo_elemento_drop.to_s)
        ReportHelper.register_event
    end

    def get_user_agent
        puts "actual user agent " + page.driver.execute_script("return navigator.userAgent")
    end

    def showMessage(yourMessage)
        puts "System Message: " + yourMessage
    end

    def refreshPage
        sleep 2
        page.driver.browser.navigate.refresh
        showMessage "Página atualizada"
    end

    def findWithShadowRoot(element)
        elementShadowRoot = page.find(element, wait: 20)
        shadowRoot        = page.evaluate_script('arguments[0].shadowRoot.querySelector("#search-form")', elementShadowRoot)

        return shadowRoot.find('input', wait: 15)
    end

    def sendKeysWithShadowRoot(element, field)
        field.send_keys element
    end

    def hitEnterWithShadowRoot(field)
        sleep 2
        field.native.send_keys(:return)
    end

    def clickIfVisible(element, waitTime = 10, waitPage = true)
        firstTime = Time.now
        doClick   = false

        while (Time.now - firstTime) < waitTime.to_i do
            begin
                if visible_element? element
                    click element
                    doClick = true

                    break
                end
            rescue
                if waitPage
                    sleep 2
                else
                    puts "refresh"
                    refreshPage                    
                end
            end
        end
        return doClick
        ReportHelper.register_event
    end

    def clickWaitNextElement(currentElement, nextElement, waitTime, waitPage)
        firstTime = Time.now
        doClick   = false

        while (Time.now - firstTime) < waitTime.to_i do
            begin
                if visible_element? currentElement
                    click currentElement
                    doClick = true
                    sleep 1
                end
            rescue
                if waitPage
                    sleep 1
                else
                    refreshPage
                end
            end

            if visible_element? nextElement
                break
            end
        end
        return doClick
        ReportHelper.register_event
    end

    def waitPage(urlExpected)
        iCont = 0

        while current_url != urlExpected.to_s
            if iCont < 2
                iCont = iCont.to_i + 1

                refreshPage
            else
                showMessage 'Página direcionada'
                visit(urlExpected)
                break
            end
        end
        ReportHelper.register_event
    end

end
