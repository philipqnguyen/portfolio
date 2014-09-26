require "test_helper"

describe "As a visitor, visit the article index page" do
  before do
    visit articles_path
  end

  it "should have a blog" do
    page.must_have_content "Blog"
  end

  it "should have published articles" do
    page.text.wont_include "Sorry, no articles as of yet. Come back soon!"
  end

  it "should have no link to create a new article" do
    page.has_no_link? "/article/new"
  end
end
