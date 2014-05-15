# require "test_helper"

# feature "CheckForZurb" do
#   # given we want a pretty site that is more than basic html or rails
#   scenario "Check that Zurb is being used for styling" do
#   # when we visit the root path
#     visit root_path
#   # then we want to check that zurb foundation is generating the styling
#     page.body.must_include"columns"
#   end
# end

# require "test_helper"

feature "CheckForZurb" do
  # given we want a pretty site that is more than basic html or rails
  scenario "Check that Zurb is being used for styling" do
  # when we visit the root path
    visit root_path
  # then we want to check that zurb foundation is generating the styling
    page.html.must_include"foundation_and_overrides.css"
  end
end
