require_relative '../../../features/page_bases/page_base.rb'

class LoginPage < PageBase

    #elements block begin
                                           
    element :buttonLogin,       :xpath, '//span[@class="flex items-center transition-all duration-200 rounded-md text-xs px-2 py-1" and contains(text(), "Log In")]'
    element :buttonDoLogin,     :xpath, '//button[@class="bg-primary rounded-[10px] py-1 text-textContrast"]//div[contains(text(), "Log In")]'
    element :fieldUserEmail,            '#email_desktop'
    element :fieldUserPassword,         '#password_desktop'
    element :buttonSignOff,     :xpath, '//span[@class="p-0 rounded-md text-sm px-4 py-2"]//div[contains(text(), "Sign Off")]'

    #elements block end


    #methods block begin

    def clickButtonLogin
        clickIfVisible :buttonLogin
    end

    def sendEmail(userEmail)
        send_keys :fieldUserEmail, userEmail
    end

    def sendPassword(userPassword)
        send_keys :fieldUserPassword, userPassword
    end

    def clickButtonDoLogin
        clickIfVisible :buttonDoLogin
    end 

    def userLogged?
        sleep 5
        return elemento_visivel? :buttonSignOff
    end    

    #methods block end
end