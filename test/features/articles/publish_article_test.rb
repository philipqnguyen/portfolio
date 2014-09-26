require "test_helper"

describe "Publishing articles on the web page" do
  it "should not allow Authors to publish" do
    sign_in :author

    visit new_article_path

    page.wont_have_field "Published"
  end

  it "should allow Editors select the Published button" do
    sign_in :editor

    visit new_article_path

    page.must_have_field "Published"
  end

  it "should allow Editors to publish" do
    sign_in :editor
    visit new_article_path

    fill_in "Title", with: "Article to be published"
    fill_in "Body", with: "Body of article to be published"
    check "Published"
    click_on "Create Article"

    page.must_have_content "Status: Published"
  end
end
