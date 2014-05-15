require "test_helper"

feature "Projects::CreatingAProject" do
  scenario "there is the ability to create a project" do
    visit projects_path
    click_on "New Project"
    fill_in 'Name', with: 'New Project'
    fill_in 'Technologies used', with: 'Rails, Ruby'
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?(".alert-box"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end
