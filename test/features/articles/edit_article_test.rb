require "test_helper"

describe "Edit an Article on page" do
  it "should edit an existing article" do
    visit article_path(articles(:another_test).id)
    click_on "Edit"

    fill_in "Body", with: "Updated body"
    click_on "Update Article"

    page.text.must_include "successfully updated."
  end
end