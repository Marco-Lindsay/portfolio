require "test_helper"

feature "Editing a Post" do
  scenario "submit updates to existing post" do
    post = Post.create(title: "Becoming a Code Fellow", body: "Means striving for excellence.")
    visit posts_path(post)

    page.find("tbody tr:last").click_on "Edit"
    fill_in "Title", with: posts(:cr).title
    click_on "Update Post"

    page.text.must_include posts(:cr).title
    page.text.must_include posts(:cf).body

  end
end

