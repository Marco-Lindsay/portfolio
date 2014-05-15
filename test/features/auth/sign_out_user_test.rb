require "test_helper"

feature "Once you sign in as a user you are able to sign out" do
  scenario "ability to sign out is available" do

  visit "/users/sign_in"
  fill_in "Email", with: users(:marco).email
  fill_in "Password", with: '12345678'
  click_button "Sign in"
  page.must_have_content "Signed in successfully."

  click_link "Sign out"
  page.must_have_content "Signed out successfully."
  end
end
