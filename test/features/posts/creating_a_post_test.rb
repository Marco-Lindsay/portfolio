require "test_helper"

feature "Creating a Post" do
  scenario "submit form data to create a new post" do
    visit new_user_session_path
    fill_in "Email", with: users(:marco).email
    fill_in "Password", with: "12345678"
    click_button "Sign in"

    visit new_post_path
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    click_on "Create Post"
    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:cr).body
    page.has_css? "#author"
    page.text.must_include users(:marco).email
  end
end
