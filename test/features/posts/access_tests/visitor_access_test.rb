require "test_helper"

feature "what content a visitor can access" do

  scenario "site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
    page.wont_have_link "New Post"
  end

  scenario "site vistitors can view published posts" do
    visit posts_path
    page.must_have_content "Listing posts"
    page.wont_have_link "Edit"
    page.wont_have_link "Destroy"
  end

  scenario "site vistitors cannot view unpublished posts" do
    visit posts_path
    page.must_have_content posts(:published).title
    page.must_have_content posts(:published).body
    page.wont_have_content posts(:unpublished).title
    page.wont_have_content posts(:unpublished).body
  end

end
