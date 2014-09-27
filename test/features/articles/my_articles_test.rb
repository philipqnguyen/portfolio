require "test_helper"

describe "As an author, I want to see only my articles on a page" do
  it "should return only articles belonging to the author" do
    sign_in :author
    visit articles_path

    click_on "My Articles"

    page.text.must_include articles(:author_art_1).title
    page.text.must_include articles(:author_art_2).title
    page.text.wont_include articles(:hello_test).title
  end
end
