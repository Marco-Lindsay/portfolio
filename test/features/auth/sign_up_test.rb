require "test_helper"

feature "The ability to sign up for the site on the landing page" do
  scenario "I come to the root of the page and can sign in or sign up" do
    visit "/"
    click_on "Sign up"

  fill_in "Email", with: "marco@marco.com"
  fill_in "Password", with: "123456"
  fill_in "Password confirmation", with: "123456"
  click_on "Sign up"

  page.must_have_content "Welcome! You have signed up successfully"
  page.wont_have_content "There was a problem with your sign up"

  end
end
