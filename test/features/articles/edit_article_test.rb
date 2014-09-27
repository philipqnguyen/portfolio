require "test_helper"

describe "Edit an Article on page" do
  it "should edit an existing article as an author" do
    sign_in
    visit new_article_path
    fill_in "Title", with: "Test title by king"
    fill_in "Body", with: "Test body by kong"
    click_on "Create Article"
    click_on "Edit"

    fill_in "Body", with: "Updated body"
    click_on "Update Article"

    page.text.must_include "successfully updated."
  end

  it "should edit an existing article as an author" do
    sign_in :editor
    visit edit_article_path articles(:hello_test).id

    fill_in "Title", with: "Test title by the editor"
    fill_in "Body", with: "Test body by editor"
    click_on "Update Article"

    page.text.must_include "successfully updated."
  end

  it "should not allow visitors to edit existing articles" do
    visit edit_article_path articles(:hello_test).id

    page.text.must_include "You need to sign in or sign up before continuing"
  end
end
