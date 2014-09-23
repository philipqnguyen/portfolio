require "test_helper"

describe "New Article page" do
  it " Should create a new article from articles_path" do
    visit articles_path
    click_on 'New Article'

    page.fill_in "Title", with: "A test title"
    page.fill_in "Body", with: "A test body"
    click_on "Create Article"

    page.text.must_include "Article was successfully created."
    page.text.must_include "A test title"
    page.text.must_include "A test body"
  end
end
