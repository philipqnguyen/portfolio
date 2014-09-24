require "test_helper"

describe "Edit an Article on page" do
  it "should edit an existing article" do
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
end
