require "test_helper"

feature "CheckForZurb" do
  scenario "Check that Zurb is being used for styling" do
  visit root_path
  page.body.must_include"top-bar"
  end
end
