require 'test_helper'

describe 'As a user, I want my articles to be connected to me on the page' do
  it 'should have the email of the author on the article' do
    sign_in
    visit new_article_path

    fill_in 'Title', with: 'Article post by tester'
    fill_in 'Body', with: 'Body of article by tester'
    click_on 'Create Article'

    page.has_css?('#author').must_equal true
    page.must_have_content users(:king_kong).email
  end
end
