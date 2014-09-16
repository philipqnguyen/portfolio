require "test_helper"

describe "Can acces home page", :capybara do
  it "should have content" do
    visit root_path
    page.must_have_content "Welcome#index"
  end
end
