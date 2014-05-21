require "test_helper"

feature "Blog has a comments feature" do
  scenario "when i visit the site I am able to leave comments" do
    visit posts_path
    page.find('tr', :text => title).click_on "Show"
    title = posts(:cr).title
    fill_in "Comment", with: comments(:one).content
    fill_in "Email", with: comments(:one).author_email
    click_on "Submit Comment"
    page.must_have_content "Comment submited for approval"
  end

  scenario "As an editor I can approve comments" do
    sign_in(:editor)
    page.find('tr', :text => title).click_on "Edit"
    title = posts(:cr).title
    check "Approve comment"
    click_on "Submit Comment"
    page.must_have_content "Comment Published"
  end

  scenario "As an author I can approve comments on my posts" do
    sign_in(:author)
    page.find('tr', :text => title).click_on "Edit"
    title = posts(:cr).title
    check "Approve comment"
    click_on "Submit Comment"
    page.must_have_content "Comment Published"
  end

end
