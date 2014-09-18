require "test_helper"

feature "Edit an Article" do
  scenario "by editing an existing article" do
    article = Article.create(
      title: "Test title to update",
      body: "Test body to update"
    )
    visit article_path(article)
    click_on "Edit"

    fill_in "Body", with: "Updated body"
    click_on "Update Article"

    page.text.must_include "Updated body"
  end
end
