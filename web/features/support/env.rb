require "allure-cucumber"
require "webdrivers"
require "selenium-webdriver"
require "capybara"
require "capybara/cucumber"
require "Faker"
require "mongo"

CONFIG = YAML.load_file(File.join(Dir.pwd, "features/support/config/#{ENV["CONFIG"]}"))

case ENV["BROWSER"]
when "firefox"
  @driver = :selenium
when "chrome"
  @driver = :selenium_chrome
when "fire_headless"
  @driver = :selenium_headless
when "chrome_headless"
  @driver = :selenium_chrome_headless
else
  raise "Navegador incorreto, variável @driver vazia :("
end

Capybara.configure do |config|
  #config.default_driver = :selenium_chrome #execucao chrome
  #config.default_driver = :selenium_chrome_headless #headless no Chromex
  #config.default_driver = :selenium #execucao no firefox
  #config.default_driver = :selenium_headless #headless no firefox
  config.default_driver = @driver
  config.app_host = CONFIG["url"]
  config.default_max_wait_time = 10
end

AllureCucumber.configure do |config|
  config.results_directory = "/logs"
  config.clean_results_directory = true
end
