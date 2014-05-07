require "test_helper"

feature "EditingAPost" do
  scenario "edits a post" do
    post = Post.create(title: "this is a title", body: "this is a body")
    visit post_path(post)

    click_on "Edit"
    fill_in "Title", with: "this is a different title"
    click_on "Update Post"

    page.text.must_include "this is a different title"
    page.text.must_include "Page was successfully updated"

  end
end
