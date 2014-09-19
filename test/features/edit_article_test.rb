require "test_helper"

feature "Edit an Article" do
  scenario "by editing an existing article" do
    visit article_path(articles(:another_test).id)
    click_on "Edit"

    fill_in "Body", with: "Updated body"
    click_on "Update Article"

    page.text.must_include "Updated body"
  end
end
