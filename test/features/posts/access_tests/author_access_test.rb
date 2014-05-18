require "test_helper"

feature "what content an author can access" do
   scenario "authors can't publish" do
      sign_in(:author)
      visit new_post_path
      page.wont_have_field('Published')
    end

    scenario "as an author I should not be able to delete posts" do
      sign_in(:author)
      visit posts_path
      page.wont_have_link "Destroy"
    end

    scenario "as an author I want to create posts" do
      sign_in(:author)
      visit new_post_path
      page.wont_have_field('Published')
      fill_in "Title", with: posts(:cr).title
      fill_in "Body", with: posts(:cr).body
      click_on "Create Post"
      page.text.must_include "Post was successfully created"
    end

    scenario "as an author I want to update posts" do
      sign_in(:author)
      title = posts(:unpublished).title
      visit posts_path
      page.find('tr', :text => title).click_on "Edit"
      fill_in "Title", with: posts(:cr).title
      click_on "Update Post"
      page.text.must_include posts(:cr).title
      page.wont_have_content title
    end

    scenario "as an author I can only see posts that I am the author of" do
      sign_in(:author)
      visit posts_path
      page.must_have_content posts(:unpublished).title
      page.must_have_content posts(:unpublished).body
      page.wont_have_content posts(:cf).title
      page.wont_have_content posts(:cf).body
    end
end
