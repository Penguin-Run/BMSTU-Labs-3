# Generated by Selenium IDE
require 'selenium-webdriver'
require 'json'
describe 'Firsttest' do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @vars = {}
  end
  after(:each) do
    @driver.quit
  end
  it 'firsttest' do
    @driver.get('http://127.0.0.1:3000/')
    @driver.manage.resize_to(1110, 797)
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('343')
    @driver.find_element(:id, 'number').send_keys(:enter)
    @driver.find_element(:id, 'number').send_keys('344')
    @driver.find_element(:id, 'number').send_keys(:enter)
    @driver.find_element(:id, 'number').send_keys('345')
    @driver.find_element(:id, 'number').send_keys(:enter)
    @driver.find_element(:id, 'calc_form').click
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('98798674656')
    @driver.find_element(:name, 'commit').click
    element = @driver.find_element(:name, 'commit')
    @driver.action.move_to_element(element).perform
    element = @driver.find_element(By.CSS_SELECTOR, 'body')
    @driver.action.move_to_element(element, 0, 0).perform
    @driver.find_element(:id, 'number').click
    @driver.find_element(:id, 'number').send_keys('98798674655')
    @driver.find_element(:id, 'number').send_keys(:enter)
    @driver.find_element(:id, 'calc_form').click
    @driver.find_element(:id, 'number').send_keys('invalid data')
    @driver.find_element(:id, 'number').send_keys(:enter)
    @driver.find_element(:id, 'calc_form').click
    @driver.find_element(:css, 'h3').click
    @driver.find_element(:css, 'html').click
  end
end