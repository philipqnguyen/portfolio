require "test_helper"

describe "Visit the article index page", :capybara do

  it "should have a blog" do
    visit articles_path
    page.must_have_content "Blog"
  end

  it "should have published articles" do
    visit articles_path

    page.text.wont_include "Sorry, no articles as of yet. Come back soon!"
  end

  it "should create a new article" do
    page.has_link? "/article/new"
  end
end
