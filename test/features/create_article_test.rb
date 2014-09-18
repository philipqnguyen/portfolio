require "test_helper"

feature "New Article" do
  scenario "Create a new article from articles_path" do
    visit articles_path
    click_on 'New Article'

    page.fill_in "Title", with: "A test title"
    page.fill_in "Body", with: "A test body"
    click_on 'Create Article'

    page.has_no_field? "Title"
    page.has_no_field? "Body"
    page.text.must_include "A test title"
    page.text.must_include "A test body"
  end
end
