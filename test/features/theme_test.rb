require "test_helper"

describe "Theme from home page" do
  it "should detect for the existance of a Zurb" do
    visit root_path

    page.html.must_include "columns"
  end
end
