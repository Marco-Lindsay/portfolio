require "test_helper"

feature "Check for my name" do
  scenario "my site is up online" do
    # Given that my site is running on Heroku

    # When my site is hit
    visit "http://www.marcolindsay.com"

    # Then a response is received.
    page.must_have_content "marco lindsay"

  end
end
