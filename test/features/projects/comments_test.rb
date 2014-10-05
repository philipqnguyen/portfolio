require 'test_helper'

describe 'Comments in project show page' do
  it 'should not allow unsigned visitors to comment' do
    visit project_path projects(:project_2)

    page.has_button?('Create Comment').must_equal false
  end

  it 'should allow signed in visitors to comment' do
    sign_in :visitor
    visit project_path projects(:project_2)

    fill_and_submit_comment

    page.must_have_content 'Your comment will be reviewed'
  end

  it 'should allow unsigned or signed visitors to see approved comments' do
    visit project_path projects(:project_1)

    page.must_have_content 'approved project comment'
  end

  it 'should not allow unsigned/signed visitors to see unapproved comments' do
    visit project_path projects(:project_1)

    page.wont_have_content 'unapproved project comment'
  end
end

describe 'Comment approvals in Author page' do
  it 'should allow editors to view the unapproved project comment' do
    sign_in :editor
    visit author_page_path

    page.must_have_content 'unapproved project comment'
  end

  it 'should allow authors to view the approved project comment' do
    sign_in :the_hobbit

    visit author_page_path

    page.must_have_content 'unapproved project comment'
  end

  it 'should not allow authors to see comments already approved' do
    sign_in :the_hobbit

    visit author_page_path

    page.wont_have_content 'this is an approved project comment'
  end
end
