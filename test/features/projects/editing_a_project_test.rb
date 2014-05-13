require "test_helper"

feature "Being able to edit projects that I have created" do
  scenario "editing an existing project" do
    visit edit_project_path(projects(:freelance))

    fill_in "Name", with: projects(:portfolio).name
    fill_in "Technologies used", with: projects(:portfolio).technologies_used

    click_on "Update Project"

    page.text.must_include projects(:portfolio).name
    page.text.must_include projects(:portfolio).technologies_used
    page.text.must_include "success"
  end
end
