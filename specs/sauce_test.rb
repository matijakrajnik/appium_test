require 'rubygems'
require 'rspec'
require 'appium_lib'
require 'net/http'
require 'sauce_whisk'
require_relative './sauce_helper'

describe 'UI Catalog' do
  before(:all) do
    set_env_variables
    upload_zip
    Appium::Driver.new(desired_caps).start_driver
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
  end
  after(:all) do
    unset_env_variables
    driver_quit
  end

  describe 'test' do
    it 'test' do
      table = find_elements(:class_name, 'UIATableView')[0]
      #button_exact('UICatalog').click
      find_elements(:name, 'UICatalog').last.click
      cells = table.find_elements(:class_name, 'UIATableCell')
      cells.each do |cell|
        sleep(1)
        puts cell.name
        cell.click
      end
    end
  end
end

