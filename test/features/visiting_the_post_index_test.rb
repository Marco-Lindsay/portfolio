require "test_helper"

feature "VisitingThePostIndex" do
  scenario "with existing posts" do
    post = posts(:cr).title
    # Post.create(title: "Becoming a Code Fellow", body: "Means striving for exellence.")
    visit posts_path
    page.must_have_content posts(:cr).title
  end
end
