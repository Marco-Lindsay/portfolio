require "test_helper"

feature "Blog has a comments feature" do
  scenario "when i visit the site I am able to leave comments" do
    visit posts_path
    title = posts(:cr).title
    page.find('tr', :text => title).click_on "Show"
    fill_in "Content", with: comments(:one).content
    fill_in "Email", with: comments(:one).author_email
    click_on "Submit Comment"
    page.must_have_content "Comment submited for approval"
  end

  scenario "As an editor I can approve comments" do
    sign_in(:editor)
    visit posts_path
    title = posts(:cr).title
    page.find('tr', :text => title).click_on "Edit"
    check "Approve comment"
    click_on "Submit Comment"
    page.must_have_content "Comment Published"
  end

  scenario "As an author I can approve comments on my posts" do
    sign_in(:author)
    visit posts_path
    title = posts(:unpublished).title
    page.find('tr', :text => title).click_on "Edit"
    check "Approve comment"
    click_on "Submit Comment"
    page.must_have_content "Comment Published"
  end

end
