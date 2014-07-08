require "test_helper"

feature "DeletingAPost" do
  scenario "Druken rant can be expunged" do
    sign_in(:editor)
    post = posts(:cr)

    visit posts_path
    page.find("tbody tr:last").click_on "Destroy"

    page.wont_have_content posts(:cr)
  end
end

