require "test_helper"

describe "As a visitor, visit the article show page" do

  it "should be able to view the whole article" do
    visit articles_path

    page.all(:link, "Show")[0].click

    current_path.must_match(/articles\/[0-9]/)
  end

  it "should not see edit or destroy link" do
    visit article_path articles(:article_3).id

    page.text.wont_include "Destroy"
    page.text.wont_include "Delete"
    page.text.wont_include "Edit"
    page.has_no_link? edit_article_path articles(:article_3).id
  end

  it "should not view the show page of unpublished articles" do
    visit article_path articles(:article_unpublished).id

    page.text.wont_include articles(:article_unpublished).title
    page.text.wont_include articles(:article_unpublished).body
  end
end
