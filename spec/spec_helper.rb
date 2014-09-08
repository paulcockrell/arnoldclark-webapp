ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'
require 'rspec/autorun'

require 'page-object'
require 'watir'
require 'watir/rails'
require 'data_magic'

Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.infer_base_class_for_anonymous_controllers = false

  config.before do
    #XXX We should cycle through browsers
    #
    @browser = Watir::Browser.new :firefox
  end

  config.after do
    @browser.close
  end
end
