#Variaveis globais
AMBIENTE = ENV['AMBIENTE']
SO = ENV['SO']
BROWSER = ENV['BROWSER']
REMOTE_DRIVER = ENV['REMOTE_DRIVER']
HUB_URL = ENV['HUB_URL']
TIMEOUT_PADRAO = ENV['TIMEOUT_PADRAO']
SALVAR_SCREENSHOT_PARA_CADA_PASSO = ENV['SALVAR_SCREENSHOT_PARA_CADA_PASSO']
DIRETORIO_DOWNLOADS = ENV['DIRETORIO_DOWNLOADS']
CONFIG = YAML.load_file(File.dirname(__FILE__)+"/ambientes/#{AMBIENTE}.yml") 

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