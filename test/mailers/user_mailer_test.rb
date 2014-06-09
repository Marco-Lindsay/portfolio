require "test_helper"

feature UserMailer do
  scenario "contact page will send out email" do
    visit '/contact'
    fill_in "name", with: "marco"
    fill_in "email", with: "marco@marco.com"
    fill_in "message", with: "really long message"
    click_on "Send"
    page.must_have_content "Your message has been sent!"

  end

  scenario "contact will require all fields" do
    visit '/contact'
    fill_in "name", with: "marco"
    fill_in "message", with: "really long message"
    click_on "Send"
    page.must_have_content "Please note that all fields are required"

  end
end
