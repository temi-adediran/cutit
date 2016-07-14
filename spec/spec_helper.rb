require 'simplecov'
SimpleCov.start 'rails'
require "coveralls"
Coveralls.wear! 'rails'
require 'factory_girl_rails'
require 'support/form_helpers'
require 'capybara'
require 'support/database_cleaner'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
    expectations.syntax = :expect
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.include FactoryGirl::Syntax::Methods
  config.include FormHelpers, type: :feature
end
