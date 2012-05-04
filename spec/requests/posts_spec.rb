require 'spec_helper'

describe "Posts" do
   describe "GET /posts" do
    it "displays posts" do
      Factory.create(:post)
      visit posts_path
      page.should have_content("Recent Posts")
      #page.should have_selector("div#post_title", :count => 4)
    end

    it "supports js", :js => true do
      visit posts_path
      click_link "test js"
      page.should have_content("js works")
    end
  end
end
