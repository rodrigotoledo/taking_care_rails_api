ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"
require "simplecov"
SimpleCov.start "rails" do
  add_filter "vendor"
  add_filter "storage"
  add_filter "app/helpers/application_helper.rb"
  add_filter "app/jobs/application_job.rb"
  add_filter "app/models/session.rb"
  add_filter "app/mailers/application_mailer.rb"
  add_filter "app/mailers/passwords_mailer.rb"
  add_filter "app/controllers/sessions_controller.rb"
  add_filter "app/controllers/concerns/authentication.rb"
  add_filter "app/channels/application_cable/connection.rb"
  add_filter "app/controllers/application_controller.rb"
  add_filter "app/controllers/passwords_controller.rb"
  add_filter "app/controllers/registrations_controller.rb"
end

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end
