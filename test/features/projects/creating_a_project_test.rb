require 'test_helper'

describe 'As the site owner, I want to add a portfolio item page' do
  it "should result in 'Project successfully created.'" do
    sign_in :editor
    visit projects_path
    click_on 'New Project'

    page.fill_in 'Name', with: 'A Test Project'
    page.fill_in 'Technologies used', with: 'The body of a test project'
    click_on 'Create Project'

    page.text.must_include 'Project was successfully created.'
    page.text.must_include 'A Test Project'
    page.text.must_include 'The body of a test project'
    page.status_code.must_equal 200
  end

  it 'should not submit if inputs are unfilled' do
    sign_in :editor
    visit new_project_path

    click_on 'Create Project'

    current_path.must_match(/projects$/)
    page.text.must_include 'Project could not be saved'
    page.text.must_include 'Name is too short'
    page.text.must_include "Technologies used can't be blank"
  end
end
