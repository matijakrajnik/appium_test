require 'rubygems'
require 'rspec'
require 'appium_lib'
require 'net/http'
require_relative './spec_helper'

describe 'UI Catalog' do
  before(:all) do
    Appium::Driver.new(desired_caps).start_driver
    Appium.promote_appium_methods RSpec::Core::ExampleGroup
  end

  def back_click(opts={})
    opts        ||= {}
    search_wait = opts.fetch(:wait, 10) # seconds
    wait(search_wait) { button_exact('Back').click }
  end

  after(:all) do
    driver_quit
  end

  describe 'test' do
    it 'test' do
      table = find_elements(:class_name, 'UIATableView')[0]
      button_exact('UICatalog').click
      cells = table.find_elements(:class_name, 'UIATableCell')
      cells.each do |cell|
        sleep(1)
        cell.click
      end
    end
  end
end
