require 'test_helper'

describe 'Show single project page' do
  it 'should show a single project' do
    visit project_path(projects(:project_2).id)

    current_path.must_match "/projects/#{projects(:project_2).id}"
    page.must_have_content projects(:project_2).name
    page.wont_have_content projects(:project_1).name
  end
end
