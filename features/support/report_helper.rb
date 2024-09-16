require 'allure-cucumber'
require_relative '../support/general_helper'

class ReportHelper

    @@screenshot_counter = 0

    def self.register_event

        title = "#{get_formatted_counter}-#{caller[1][/`.*'/][1..-2]}"
        if SALVAR_SCREENSHOT_PARA_CADA_PASSO.eql?('true')
            register_info title 
            register_screenshot title
        else
            register_info title
        end
       
    end

    private

    def self.register_info title

        content = "#{title} at #{Time.now.strftime("%d/%m/%Y %H:%M:%S")}"
        Allure.add_attachment(name: title, source: content, type: Allure::ContentType::TXT)

    end

    def self.register_screenshot title
    
        local_path = GeneralHelper.capture_screenshot title
        attach_screenshot local_path, title

    end

    def self.get_formatted_counter

        current_counter = @@screenshot_counter
        @@screenshot_counter += 1
        return current_counter.to_s.rjust(4, "0")

    end
    
    def self.attach_screenshot local_path, title
    
        file = File.open(local_path, "r")
        Allure.add_attachment(name: title, source: file, type: Allure::ContentType::PNG)
        file.close
    
    end

end