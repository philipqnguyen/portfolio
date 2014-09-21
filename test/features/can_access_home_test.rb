require "test_helper"

describe "Can acces home page" do
  it "should have content locally" do
    visit root_path
    page.must_have_content "Welcome"
  end
end

# The test below will work with default_driver = :poltergeist
# However, poltergeist will cause a transaction in sqlite to fail
# So poltergeist and this this test below has been commented out.
#
# describe "Remote home page" do
#   it "should access remote content" do

#     visit "philip-q-nguyen.com"

#     save_and_open_page

#     page.must_have_content "Welcome"
#   end
# end

