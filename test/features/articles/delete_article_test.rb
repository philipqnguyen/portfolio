require 'test_helper'

describe 'As an editor, delete an Article from the page' do
  before do
    sign_in :editor
  end

  it 'should delete from the index' do
    visit articles_path
    current_article_count = page.all(:link, 'Destroy').count

    page.all(:link, 'Destroy')[0].click

    page.all(:link, 'Destroy').count.must_equal(current_article_count - 1)
  end

  it 'should delete from the show' do
    visit article_path articles(:hello_test).id

    click_on 'Destroy'

    page.text.must_include 'Article was successfully destroyed.'
  end
end

describe "As an author, I can't delete an Article from the page" do
  before do
    sign_in :author
  end

  it 'should not delete from the index' do
    visit articles_path

    page.has_no_link?('Destroy').must_equal true
  end

  it 'should not delete from the show' do
    visit article_path articles(:hello_test).id

    page.has_no_link?('Destroy').must_equal true
  end

  it 'should not delete my own article from the show' do
    visit article_path articles(:author_art_2).id

    page.has_no_link?('Destroy').must_equal true
  end
end
