require "test_helper"

describe "As a user, I want to sign out from the web page" do
  it "should sign out successfully" do
    visit new_user_session_path

    fill_in "Email", with: users(:the_hobbit).email
    fill_in "Password", with: "password"
    click_on "Log in"
    click_on "Sign out"

    page.must_have_content "Signed out successfully."
    current_path.must_match "/"
  end
end
