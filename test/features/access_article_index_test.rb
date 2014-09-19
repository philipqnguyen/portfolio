require "test_helper"

feature "Visit the article index page" do

  scenario "should have a blog" do
    visit articles_path
    page.must_have_content "Blog"
  end

  scenario "with published articles" do
    visit articles_path

    page.text.wont_include "Sorry, no articles as of yet. Come back soon!"
  end

  scenario "to create a new article" do
    page.has_link? "/article/new"
  end
end
