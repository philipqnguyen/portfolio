require 'test_helper'

describe 'As a visitor, visit the article index page' do
  before do
    visit articles_path
  end

  it 'should have a blog' do
    page.must_have_content 'Blog'
  end

  it 'should have published articles' do
    page.text.wont_include 'Sorry, no articles as of yet. Come back soon!'
  end

  it 'should not see a link to create a new article' do
    page.has_no_link?('/article/new').must_equal true
  end

  it 'should not see a destroy link' do
    page.text.wont_include 'Destroy'
    page.text.wont_include 'Delete'
  end

  it 'should not see a link to edit articles' do
    page.text.wont_include 'Edit'
    page.has_no_link?(
      edit_article_path(articles(:hello_test).id)).must_equal true
  end

  it 'should not see a link to make new articles' do
    page.text.wont_include 'New Article'
    page.has_no_link?(new_article_path).must_equal true
  end

  it 'should not see unpublished articles' do
    page.text.wont_include articles(:article_unpublished).title
  end
end

describe 'As an editor, visit the index page' do
  before do
    sign_in :editor
    visit articles_path
  end

  it 'should see all articles, regardless of published status' do
    page.text.must_include articles(:hello_test).title
    page.text.must_include articles(:article_unpublished).title
  end

  it 'should see a destroy link' do
    page.text.must_include 'Destroy'
  end

  it 'should see a link to edit articles' do
    page.text.must_include 'Edit'
    page.has_link?('Edit').must_equal true
  end

  it 'should see a link to make new articles' do
    page.text.must_include 'New Article'
    page.has_link?('New Article').must_equal true
  end
end
