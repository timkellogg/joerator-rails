require 'capybara/rspec'
require 'simplecov'

SimpleCov.start do 
  # exclude external code from testing (tested at source)
  add_filter "support/wait_for_ajax"
  add_filter "../uploaders/picture_uploader"
end

RSpec.configure do |config|
  require_relative 'support/database_cleaner'
  require_relative 'support/wait_for_ajax'

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
