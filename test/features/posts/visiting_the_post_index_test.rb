require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts" do
    post = posts(:cr).title
    visit posts_path
    page.must_have_content posts(:cr).title
  end
end
