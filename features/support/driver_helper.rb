require 'capybara/cucumber'
require 'selenium-webdriver'

Capybara.register_driver :selenium do |app| 

    if BROWSER.eql?('chrome')     
        if SO.eql?('linux')
            Selenium::WebDriver::Chrome.driver_path =  './resources/drivers/chromedriver'
        elsif SO.eql?('windows')
            puts "driver"
        end

        download_path = File.expand_path('downloads').gsub! "/", "\\"
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_preference(:download, directory_upgrade: true,
            prompt_for_download: false,
            default_directory: download_path)
            options.add_argument('--incognito')
        Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)

    elsif BROWSER.eql?('chrome_headless')
        if SO.eql?('linux')
            Selenium::WebDriver::Chrome::Service.driver_path =  '/usr/bin/chromedriver'
        elsif SO.eql?('windows')
            puts "driver"
        end
        
        download_path = File.expand_path('downloads').gsub! "/", "\\"
        options = Selenium::WebDriver::Chrome::Options.new
        options.add_preference(:download, directory_upgrade: true,
            prompt_for_download: false,
            default_directory: download_path)
        options.add_argument('--incognito')            
        options.add_argument('--headless')
        options.add_argument('--no-sandbox')
        options.add_argument('--window-size=1366,768')
        options.add_argument('--disable-dev-shm-usage')        
        
        Capybara::Selenium::Driver.new(app, :browser => :chrome, options: options)

    elsif BROWSER.eql?('firefox')   
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)

    elsif BROWSER.eql?('ie')      
        Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)

    elsif BROWSER.eql?('safari')       
        Capybara::Selenium::Driver.new(app, :browser => :safari)
        OPTIONS = { js_errors: false }

    elsif BROWSER.eql?('poltergeist')       
        Capybara::POLTERGEIST::Driver.new(app, options)
    end
end

Capybara.register_driver :remote_browser do |app|
    Capybara::Selenium::Driver.new(app, :browser => :remote, :desired_capabilities => BROWSER.to_sym, :url => HUB_URL.to_s)
end

Capybara.configure do |config|
    if REMOTE_DRIVER.eql?('true')
       config.default_driver = :remote_browser
    else
       config.default_driver = :selenium
    end
    config.app_host = CONFIG['url_padrao']
    config.default_max_wait_time = TIMEOUT_PADRAO.to_f
end