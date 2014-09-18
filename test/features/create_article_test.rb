require "test_helper"

feature "New Article" do
  scenario "by clicking on the create button" do
    visit articles_path

    click_on 'New Article'

    # page.has_field? "Title"
    # page.has_field? "Body"

    # scenario "and completes the article form" do
    page.fill_in "Title", with: "A test title"
    page.fill_in "Body", with: "A test body"

    click_on 'Create Article'

    page.has_no_field? "Title"
    page.has_no_field? "Body"
    page.text.must_include "A test title"
    page.text.must_include "A test body"
    # end
  end
end
