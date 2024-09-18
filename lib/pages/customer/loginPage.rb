require_relative '../../../features/page_bases/page_base.rb'

class LoginPage < PageBase

    #elements block begin
                                           
    element :buttonLogin,           :xpath, '//span[@class="flex items-center transition-all duration-200 rounded-md text-xs px-2 py-1" and contains(text(), "Log In")]'
    element :buttonDoLogin,         :xpath, '//button[@class="bg-primary rounded-[10px] py-1 text-textContrast"]//div[contains(text(), "Log In")]'
    element :fieldAboutUser,        :xpath, '//div[@class="flex top-0 relative gap-12 flex-col lg:flex-row lg:gap-16 lg:pt-10 lg:px-10 w-full"]'
    element :fieldWrongCredentials, :xpath, '//*[contains(text(), "incorrect")]'    
    element :fieldUserEmail,                '#email_desktop'
    element :fieldUserPassword,             '#password_desktop'

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
        sleep 10
        return visible_element? :fieldAboutUser
    end

    def notUserLogged?
        sleep 10
        return visible_element? :fieldWrongCredentials
    end

    #methods block end
end