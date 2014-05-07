require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts" do
    Post.create(title: "Becoming a Code Fellow", body: "Means striving for exellence.")
    visit posts_path
    page.must_have_content "Becoming a Code Fellow"
  end
end
