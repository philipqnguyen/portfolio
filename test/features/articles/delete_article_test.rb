require "test_helper"

describe "As an editor, delete an Article from the page" do
  before do
    sign_in :editor
  end

  it "should delete from the index" do
    visit articles_path
    current_article_count = page.all(:link, "Destroy").count

    page.all(:link, "Destroy")[0].click

    page.all(:link, "Destroy").count.must_equal(current_article_count - 1)
  end

  it "should delete from the show" do
    visit article_path articles(:hello_test).id

    click_on "Destroy"

    page.text.must_include "Article was successfully destroyed."
  end
end
