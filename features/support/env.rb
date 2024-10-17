#Variaveis globais
SAVE_SCREENSHOT_STEP_BY_STEP = ENV['SAVE_SCREENSHOT_STEP_BY_STEP']
DIRETORIO_DOWNLOADS          = ENV['DIRETORIO_DOWNLOADS']
TIMEOUT_PADRAO               = ENV['TIMEOUT_PADRAO']
REMOTE_DRIVER                = ENV['REMOTE_DRIVER']
AMBIENTE                     = ENV['AMBIENTE']
BROWSER                      = ENV['BROWSER']
HUB_URL                      = ENV['HUB_URL']
CONFIG                       = YAML.load_file(File.dirname(__FILE__)+"/environments/#{AMBIENTE}.yml")
SO                           = ENV['SO']

require 'capybara/cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'allure-cucumber'
require "faker"
require 'json'
require 'roo'
require 'roo-xls'

require_relative 'driver_helper.rb'
require_relative '../helpers/page_helper.rb'

World(PageObjects)
AllureCucumber.configure do |config|
    config.results_directory = "reports_allure"
    config.clean_results_directory = true
    config.logging_level = Logger::INFO
end

#personal variables
EMAILPROD       = 'raiinmaker.qa@gmail.com'
PASSWORDPROD    = 'RaiinCoin$2024'  
EMAILSTAGING    = 'thyago@raiinmaker.com'
PASSWORDSTAGING = '1955$outO'
EMAILDEV        = 'thyago@raiinmaker.com'
PASSWORDDEV     = '1955$outO'