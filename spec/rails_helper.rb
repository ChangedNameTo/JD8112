ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'pundit/rspec'
require 'factory_bot_rails'
require 'capybara/rspec'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
    Rails.application.load_seed
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end

  config.after(:each) do
    Timecop.return
  end


  config.include FactoryBot::Syntax::Methods
  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
  config.use_transactional_fixtures = true
  config.fail_fast                  = true
  config.formatter                  = 'documentation'
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    # Choose a test framework:
    with.test_framework :rspec

    # Choose one or more libraries:
    with.library :active_record
    with.library :active_model
    with.library :action_controller
    # Or, choose the following (which implies all of the above):
    with.library :rails
  end
end
