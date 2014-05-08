require "test_helper"

feature "DeletingAPost" do
  scenario "Druken rant can be expunged" do
    post = posts(:cr).title

    visit posts_path
    page.find("tbody tr:last").click_on "Destroy"

    page.wont_have_content posts(:cr).title
  end
end

# require "test_helper"

# feature "DeletingAPost" do
#   scenario "Druken rant can be expunged" do
#     post = Post.create(title: posts(:cf).title, body: posts(:cf).body)
#     visit posts_path
#     page.find("tbody tr:last").click_on "Destroy"

#     page.wont_have_content posts(:cf).title
# end

