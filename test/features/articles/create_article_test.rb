require "test_helper"

describe "New Article page" do
  it "Should create a new article from articles_path" do
    sign_in

    visit new_article_path
    page.fill_in "Title", with: "A test title"
    page.fill_in "Body", with: "A test body"
    click_on "Create Article"

    page.text.must_include "Article was successfully created."
    page.text.must_include "Status: Unpublished"
    page.text.must_include "A test title"
    page.text.must_include "A test body"
  end

  it "Should not allow visitors to see the new article page" do
    visit new_article_path

    page.text.must_include "You need to sign in or sign up before continuing"
  end
end
