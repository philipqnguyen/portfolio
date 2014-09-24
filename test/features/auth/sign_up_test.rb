require "test_helper"

describe "As the site visitor, I want to be able to sign up on the web page" do
  it "should allow me to sign up for an account" do
    visit root_path
    click_on "Sign in"
    click_on "Sign up"

    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"

    click_on "Sign up"

    page.must_have_content "Welcome! You have signed up successfully."
  end
end

# describe "As site owner, I want to restrict access to the articles page" do
#   it "should not allow unsigned users to edit articles" do
#     visit edit_article_path(articles(:article_3).id)

#     page.must_have_content "Sign in"
#     page.must_have_content "You do not have permission"
#   end

#   it "should not allow unsigned users to create articles" do
#     visit new_article_path

#     page.must_have_content "Sign in"
#     page.must_have_content "You do not have permission"
#   end

#   it "should not allow unsigned users to delete articles" do
#     page.driver.submit :delete, "/articles/#{articles(:article_3).id}", {}

#     page.must_have_content "Sign in"
#     page.must_have_content "You do not have permission"
#   end
# end

# describe "As site owner, I want to restrict access to the projects page" do
#   it "should not allow unsigned users to edit projects" do
#     visit edit_project_path(projects(:project_2).id)

#     page.must_have_content "Sign in"
#     page.must_have_content "You do not have permission"
#   end

#   it "should not allow unsigned users to create projects" do
#     visit new_project_path

#     page.must_have_content "Sign in"
#     page.must_have_content "You do not have permission"
#   end

#   it "should not allow unsigned users to delete project" do
#     page.driver.submit :delete, "/projects/#{projects(:project_2).id}", {}

#     page.must_have_content "Sign in"
#     page.must_have_content "You do not have permission"
#   end
# end
