require 'test_helper'

feature "Projects::CreateProject" do
scenario "new project is missing data" do
#Given invalid data is put into form
visit new_project_path
fill_in "Name", with: "A"

# when form is submitted with bad data or missing field
click_on "Create Project"

# then the page should throw an error

page.text.must_include "Project could not be saved"
page.text.must_include "Name is too short"
page.text.must_include "Technologies used can't be blank"
end
end
