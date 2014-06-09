require "test_helper"

feature "Omniauth" do

  # feature "you can sign in to the website" do
  #   scenario "once you have signed in you are able to sign out" do
  #   visit "/users/sign_in"
  #   fill_in "Email", with: users(:marco).email
  #   fill_in "Password", with: '12345678'
  #   click_button "Sign in"
  #   page.must_have_content "Signed in successfully."
  # end
 scenario "sign in with twitter works" do
   visit root_path
   first(:link, "Sign in").click
   OmniAuth.config.test_mode = true
   Capybara.current_session.driver.request.env['devise.mapping'] = Devise.mappings[:user]
   Capybara.current_session.driver.request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
   OmniAuth.config.add_mock(:twitter,
                            {
                            uid: '12345',
                            info: { nickname: 'test_twitter_user'},
                            })
   click_on "Sign in with Twitter"
   page.must_have_content "test_twitter_user, you are signed in!"
  end

end
