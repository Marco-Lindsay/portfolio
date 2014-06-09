require "test_helper"

feature "The ability to sign up for the site on the landing page" do
  scenario "I come to the root of the page and can sign in or sign up" do
  visit root_path
  first(:link, "Sign up").click
  fill_in "Email", with: "m@marco.com"
  fill_in "Password", with: "12345678"
  fill_in "Password confirmation", with: "12345678"
  click_button "Sign up"
  page.must_have_content "Welcome! You have signed up successfully."
  page.wont_have_content "There was a problem with your sign up"
  page.wont_have_content "Email has already been taken"

  end
end
