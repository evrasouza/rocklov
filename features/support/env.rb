require 'webdrivers'
require "selenium-webdriver"
require "capybara"
require "capybara/cucumber"
require "Faker"
require 'mongo'

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
end