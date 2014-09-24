require "test_helper"

describe "As an existing user, I want to sign in on the web page" do
  it "should successfully sign in" do
    visit root_path
    click_on "Sign in"

    fill_in "Email", with: users(:joe_bob).email
    fill_in "Password", with: "password"
    click_on "Log in"

    page.must_have_content "Signed in successfully."
  end
end
