require "test_helper"

describe 'Comments on articles page' do
  describe 'As a site visitor' do
    before do
      visit article_path articles(:article_3).id
    end

    it 'should not let the visitor see unapproved comments' do
      page.wont_have_content 'This is an unapproved comment'
    end

    it 'should let the visitor see approved comments' do
      page.must_have_content 'This is an approved comment'
    end

    it 'should let the visitor comment' do
      page.fill_in 'Comments', with: 'HELLO! Comment from the visitor!'
      click_on 'Submit Comment'

      page.must_have_content 'Your comment will be reviewed'
    end
  end

  describe 'As an author, I want to approve comments on my author page' do
    before do
      sign_in :author
      visit author_page_path
    end

    it 'should let the author approve comments on his article' do
      outstanding_comments = page.all(:link, 'Approve').count

      page.all(:link, 'Approve')[0].click

      page.all(:link, 'Approve').count.must_equal(outstanding_comments - 1)
    end

    it "should not let author approve comments of other's on author page" do
      page.wont_have_content 'Author_2 comment'
    end
  end

  describe 'As an editor, I want to approve any comments on editor page' do
    before do
      sign_in :editor
      visit editor_page_path
    end

    it 'should show all comments from all authors' do
      page.must_have_content 'Author_1 comment'
      page.must_have_content 'Author_2 comment'
      page.must_have_content 'Editor comment'
    end

    it 'should let the editor approve comments' do
      outstanding_comments = page.all(:link, 'Approve').count

      page.all(:link, 'Approve')[0].click

      page.all(:link, 'Approve').count.must_equal(outstanding_comments - 1)
    end
  end
end
