ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

# Use for testing web pages
require "capybara/poltergeist"

module ActiveSupport
  class TestCase
    ActiveRecord::Migration.check_pending!

    # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in
    # alphabetical order.
    #
    # Note: You'll currently still have to declare fixtures explicitly in
    # integration tests
    # -- they do not yet inherit this setting
    fixtures :all

    # Add more helper methods to be used by all tests here...
  end
end

# class ActionDispatch::IntegrationTest
#   include Capybara::DSL
#   include Capybara::Assertions
# end

# Spec class for spec/features/**
class FeatureSpec < Capybara::Rails::TestCase
  include Capybara::DSL
  Capybara.default_driver = :rack_test
  # Capybara.javascript_driver = :poltergeist
  register_spec_type(/page$/, self)
end

def sign_in(test_user=users(:king_kong))
  visit new_user_session_path
  fill_in "Email", with: test_user.email
  fill_in "Password", with: "password"
  click_on "Log in"
end
