require "test_helper"

describe "Projects index page" do
  it "show a list of projects" do
    visit projects_path

    page.must_have_content projects(:project_1).name
    page.must_have_content projects(:project_1).technologies_used
    page.must_have_content projects(:project_2).name
    page.must_have_content projects(:project_2).technologies_used
  end
end
