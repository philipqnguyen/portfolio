ENV['RAILS_ENV'] = 'test'
require 'coveralls'
Coveralls.wear!('rails')
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
require 'minitest/rails/capybara'

# Uncomment for awesome colorful output
require 'minitest/pride'

# Use for testing web pages
require 'capybara/poltergeist'

# ActiveSupport::TestCase will be included and run by all tests
module ActiveSupport
  # This will be used by all tests
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
    def sign_in(test_user = :king_kong)
      visit new_user_session_path
      fill_in 'Email', with: users(test_user).email
      fill_in 'Password', with: 'password'
      click_on 'Log in'
    end

    def sign_in_twitter
      visit root_path
      click_on 'Sign in'
      omniauth_test_settings
      click_on 'Sign in with Twitter'
    end

    def omniauth_test_settings
      OmniAuth.config.test_mode = true
      Capybara.current_session.driver.request.env['devise.mapping'] =
        Devise.mappings[:user]
      Capybara.current_session.driver.request.env['omniauth.auth'] =
        OmniAuth.config.mock_auth[:twitter]
      OmniAuth.config.add_mock(
        :twitter,
        uid: '12345',
        info: { nickname: 'test_twitter_user' })
    end
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
