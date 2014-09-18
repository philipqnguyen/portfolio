require "test_helper"

feature "Delete an Article" do
  scenario "with a click" do
    article = Article.create(
    title: "Test title to delete",
    body: "Test body to delete"
    )
    visit articles_path

    click_on "Destroy"

    page.wont_have_content "Test body to delete"
  end
end
