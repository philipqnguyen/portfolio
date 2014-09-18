require "test_helper"

feature "Visit the article index page" do

  scenario "with no articles" do
    visit articles_path
    page.must_have_content "Sorry, no articles as of yet. Come back soon!"
  end

  scenario "with articles" do
    Article.create(
      title: "Test title to update",
      body: "Test body to update"
    )
    visit articles_path

    page.text.wont_include "Sorry, no articles as of yet. Come back soon!"
  end

  scenario "to create a new article" do
    page.has_link? "/article/new"
  end
end
