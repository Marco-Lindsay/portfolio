require "test_helper"

feature "what content an editor can access" do
    scenario "editors can publish" do
        sign_in(:editor)
        visit new_post_path
        page.must_have_field('Published')
        fill_in "Title", with: posts(:cr).title
        fill_in "Body", with: posts(:cr).body
        check "Published"
        click_on "Create Post"
        page.text.must_include "Status: Published"
    end

    scenario "editor can delete any post" do
        sign_in(:editor)
        title = posts(:cr).title
        visit posts_path
        page.must_have_content title
        page.find('tr', :text => title).click_on "Destroy"
        page.wont_have_content title
    end

    scenario "as an editor I would like to update posts" do
        sign_in(:editor)
        title = posts(:cf).title
        visit posts_path
        page.find('tr', :text => title).click_on "Edit"
        fill_in "Title", with: posts(:cr).title
        click_on "Update Post"
        page.text.must_include posts(:cr).title
        page.wont_have_content title
    end

    scenario "as an editor I can view any post regardless of whether it is published or not" do
        sign_in(:editor)
        visit posts_path
        page.must_have_content posts(:published).title
        page.must_have_content posts(:published).body
        page.must_have_content posts(:unpublished).title
        page.must_have_content posts(:unpublished).body
    end

    scenario "editor can create posts" do
        sign_in(:editor)
        visit new_post_path
        title = posts(:cf).title
        body = posts(:cf).body
        fill_in "Title", with: title
        fill_in "Body", with: body
        click_on "Create Post"
        page.text.must_include "Post was successfully created"
        page.text.must_include title
        page.text.must_include body
    end

end

