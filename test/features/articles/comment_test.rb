require 'test_helper'

describe 'Comments on articles page' do
  describe 'As an unsigned site visitor' do
    before do
      visit article_path articles(:article_3).id
    end

    it 'should not let the visitor see unapproved comments' do
      page.wont_have_content 'This is an unapproved comment'
    end

    it 'should let the visitor see approved comments' do
      page.must_have_content 'This is an approved comment'
    end

    it 'should not let the visitor comment' do
      page.must_have_content 'You must log in to comment'
    end
  end

  describe 'As a signed in visitor with twitter on the article page' do
    it 'should let the signed in visitor comment' do
      sign_in_twitter
      visit article_path(articles(:article_3).id)

      page.fill_in 'Name:', with: 'Joe Bob'
      page.fill_in 'URL:', with: 'joebobsjoe.com'
      page.fill_in 'Email:', with: 'joe@bob.com'
      page.fill_in 'Comments:', with: 'HELLO! Comment from the signed visitor!'
      click_on 'Create Comment'

      page.must_have_content 'Your comment will be reviewed'
    end
  end

  describe 'As an author, I want to approve comments on my author page' do
    before do
      sign_in :author
      visit author_page_path
    end

    it 'should let the author approve comments on his article' do
      # page.must_have_content "unapproved comment"

      check 'Approved'
      click_on 'Update Comment'

      page.wont_have_content 'unapproved comment'
    end

    it "should not let author approve comments of other's on author page" do
      page.wont_have_content 'Author_2 comment'
    end
  end

  describe 'As an editor, I want to approve any comments on editor page' do
    it 'should show all comments from all authors' do
      sign_in :editor
      visit author_page_path

      page.must_have_content 'Author_1 comment'
      page.must_have_content 'Author_2 comment'
      page.must_have_content 'Editor comment'
    end
  end
end
