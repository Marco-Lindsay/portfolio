require "test_helper"

feature "The ability to view an individual projects page" do
  scenario "view individual project" do
    visit projects_path(projects(:freelance))

    page.must_have_content projects(:freelance).name
    page.must_have_content projects(:freelance).technologies_used
  end
end
