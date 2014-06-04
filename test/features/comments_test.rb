require "test_helper"

feature "Blog has a comments feature" do
  scenario "when i visit the site I am able to leave comments" do
    visit posts_path
    title = posts(:cr).title
    page.find('tr', :text => title).click_on "Show"
    fill_in "comment_content", with: comments(:one).content
    fill_in "comment_author_email", with: comments(:one).author_email
    click_on "Create Comment"
    page.must_have_content "Comment submited for approval"
  end

  scenario "As an editor I can approve comments" do
    sign_in(:editor)
    visit posts_path
    title = posts(:cr).title
    page.find('tr', :text => title).click_on "Show"
    # save_and_open_page
    check "comment_approved"
    click_on "Create Comment"
    save_and_open_page
    page.must_have_content "Comment Published"
  end

  scenario "As an author I can approve comments on my posts" do
    sign_in(:author)
    visit posts_path
    title = posts(:unpublished).title
    page.find('tr', :text => title).click_on "Show"
    check "comment_approved"
    click_on "Create Comment"
    page.must_have_content "Comment Published"
  end

end
