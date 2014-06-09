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
end
