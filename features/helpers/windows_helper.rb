require_relative '../../features/page_bases/page_base.rb'

class WindowsHelper < PageBase

    def change_window window_name                
        Capybara.page.driver.browser.switch_to.window window_name
    end

end