require "test_helper"
# before_action :sign_in

feature "Editing a Post" do
  scenario "submit updates to existing post" do
    post = posts(:cf).title
    sign_in()
    visit posts_path(post)

    page.find("tbody tr:last").click_on "Edit"
    fill_in "Title", with: posts(:cr).title
    click_on "Update Post"

    page.text.must_include posts(:cr).title


  end
end

