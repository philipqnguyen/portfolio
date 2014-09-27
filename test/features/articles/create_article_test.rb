require "test_helper"

describe "New Article page" do
  it "Should let Authors create a new article from articles_path" do
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

  it "should let Editors create a new article" do
    sign_in :editor

    visit new_article_path
    page.fill_in "Title", with: "A title by the editor"
    page.fill_in "Body", with: "A body by the editor"
    click_on "Create Article"

    page.text.must_include "Article was successfully created."
    page.text.must_include "Status: Unpublished"
    page.text.must_include "A title by the editor"
    page.text.must_include "A body by the editor"
  end

  it "Should not allow visitors to see the new article page" do
    visit new_article_path

    page.text.must_include "You need to sign in or sign up before continuing"
  end
end
