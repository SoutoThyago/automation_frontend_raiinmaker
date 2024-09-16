require_relative '../support/report_helper.rb'

Before '@url_padrao' do | scenario |    
    visit ''
    Capybara.page.driver.browser.manage.window.maximize
end            

#Prints dos casos de sucesso
After '@after' do |scenario|  
    ReportHelper.register_screenshot "screenshoot: " + scenario.name.gsub(/\s+/, '').tr('/', '')
end