require "test_helper"

describe "Can acces home page" do
  it "should have content locally" do
    visit root_path
    page.must_have_content "Welcome"
  end
end

describe "Remote home page" do
  before do
    Capybara.current_driver = :poltergeist
  end

  it "should access remote content" do

    visit "http://philip-q-nguyen.com"

    page.must_have_content "Welcome"
  end

  after do
    Capybara.use_default_driver
  end
end
