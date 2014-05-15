require "test_helper"

feature "edit projects that I have created" do
  scenario "incorrectly editing an existing project" do
    visit edit_project_path(projects(:freelance))

    fill_in "Name", with: projects(:short).name
    click_on "Update Project"

    page.text.must_include "prohibited"
    page.text.must_include "Name is too short"
  end
end
