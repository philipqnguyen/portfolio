require "test_helper"

describe "Theme", :capybara do
  it "should detect for the existance of a Zurb" do
    visit root_path

    page.html.must_include "foundation"
  end
end
