require "test_helper"

feature "Ability to view all of the projects" do
  scenario "viewing all projects" do
    projects = projects(:freelance)
    visit projects_path
    page.must_have_content projects(:freelance).name
    page.must_have_content projects(:freelance).technologies_used
  end
end
