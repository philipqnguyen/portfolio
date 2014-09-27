require 'test_helper'

describe 'As the site owner, I want to edit a portfolio item on the page' do
  it 'should successfully edit a project' do
    visit edit_project_path(projects(:project_1).id)

    fill_in 'Name', with: 'Edit of name in project 1'
    fill_in 'Technologies used', with: 'Edit of tech used in project 1'
    click_on 'Update Project'

    page.must_have_content 'successfully updated.'
    page.must_have_content 'Edit of tech used in project 1'
    page.must_have_content 'Edit of name in project 1'
  end

  it 'Should not save changes to projects with invalid edits' do
    visit edit_project_path(projects(:project_1).id)

    fill_in 'Name', with: ''
    fill_in 'Technologies used', with: ''
    click_on 'Update Project'

    page.must_have_content 'prohibited'
    page.must_have_content 'Name is too short'
    page.must_have_content "Technologies used can't be blank"
  end
end
