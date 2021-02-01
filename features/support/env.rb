require "capybara/dsl"
require "capybara/cucumber"
require "selenium-webdriver"

Capybara.configure do |config|
    config.default_driver = :selenium_chrome
    config.app_host = "https://magento.nublue.co.uk/"
    config.default_max_wait_time = 10
end
