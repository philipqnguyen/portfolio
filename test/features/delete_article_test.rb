require "test_helper"

describe "Delete an Article page" do
  it "should delete with a click" do

    visit articles_path
    current_article_count = page.all(:link, "Destroy").count

    page.all(:link, "Destroy")[0].click

    page.all(:link, "Destroy").count.must_equal(current_article_count - 1)
  end
end
