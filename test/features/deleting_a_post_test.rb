require "test_helper"

feature "DeletingAPost" do
  scenario "Druken rant can be expunged" do
    post = Post.create(title: "this is the title", body: "this is the body")
    visit posts_path
    click_on "Destroy"

    page.wont_have_content "this is the title"
  end
end
