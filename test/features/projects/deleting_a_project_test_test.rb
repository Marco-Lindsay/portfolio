require "test_helper"

feature "deleting a project that you dont want available to the public" do
  scenario "post is removed when you click destroy" do
    visit projects_path(projects(:freelance))
    page.must_have_content projects(:freelance).name
    find('a', :text => "Destroy", match: :first).click
    page.text.must_include "Project was destroyed"
  end
end
