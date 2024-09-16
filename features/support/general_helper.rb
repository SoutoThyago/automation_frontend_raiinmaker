class GeneralHelper

    def self.capture_screenshot name    
        local_path = File.join 'report', 'screenshots', "#{name}.png"
        Capybara::page.save_screenshot local_path 
        return local_path    
    end
end