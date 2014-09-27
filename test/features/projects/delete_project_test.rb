require 'test_helper'

describe 'Delete a project on the show page' do
  scenario 'the test is sound' do
    visit project_path(projects(:project_delete).id)

    click_on 'Destroy'

    page.must_have_content 'Project was successfully destroyed'
    page.wont_have_content projects(:project_delete).name
  end
end
