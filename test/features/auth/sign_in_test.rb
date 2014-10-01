require 'test_helper'

describe 'As an existing user, I want to sign in on the web page' do
  it 'should successfully sign in' do
    sign_in

    page.must_have_content 'Signed in successfully.'
  end

  it 'should sign in with twitter' do
    visit root_path
    click_on 'Sign in'
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] =
      Devise.mappings[:user]
    Capybara.current_session.driver.request.env['omniauth.auth'] =
      OmniAuth.config.mock_auth[:twitter]
    OmniAuth.config.add_mock(:twitter,
      { uid: '12345', info: { nickname: 'test_twitter_user' }})

    click_on 'Sign in with Twitter'

    page.must_have_content "You are signed in!"
  end
end
