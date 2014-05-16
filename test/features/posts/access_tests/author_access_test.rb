require "test_helper"

feature "who can access what content" do
  scenario "unathenticated site visitors cannot visit new_post_path" do
    visit new_post_path
    page.must_have_content "You need to sign in or sign up before continuing"
    page.wont_have_link "New Post"
  end
  scenario "authors can't publish" do
    #given and authors account
    sign_in(:author)

    #when i visit the new page
    visit new_post_path

    #there is no checkbox for published
    page.wont_have_field('Published')
  end
  scenario "editors can publish" do
    # given and editors account
    sign_in(:editor)

    # when i visit a new page
    visit new_post_path

    # there is a checkbox for published
    page.must_have_field('Published')

    # when i submit the form
    fill_in "Title", with: posts(:cr).title
    fill_in "Body", with: posts(:cr).body
    check "Published"
    click_on "Create Post"

    # then the published post should be shown
    page.text.must_include "Status: Published"
  end
end
