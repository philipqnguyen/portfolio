require 'test_helper'

describe 'As an existing user, I want to sign in on the web page' do
  it 'should successfully sign in' do
    sign_in

    page.must_have_content 'Signed in successfully.'
  end

  it 'should sign in with twitter' do
    sign_in_twitter

    page.must_have_content 'you are signed in!'
  end
end
