require "test_helper"

feature "what content an editor can access" do
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
