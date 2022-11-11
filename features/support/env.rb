require 'httparty'
require 'rspec'
require 'cucumber'
require 'json'
require 'random/formatter'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'

caps = Selenium::WebDriver::Remote::Capabilities.chrome("goog:chromeOptions" => {detach: true})

Capybara.register_driver :site_prism do |app|
  browser = ENV.fetch('browser', 'chrome').to_sym
  Capybara::Selenium::Driver.new(app, browser: browser, capabilities: caps)
end

Capybara.configure do |config|
  config.default_driver = :site_prism
  config.default_max_wait_time = 10
end
