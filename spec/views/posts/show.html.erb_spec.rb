require 'spec_helper'

#describe "posts/show" do
#  before(:each) do
#    @post = assign(:post, stub_model(Post,
#      :title => "Title",
#      :description => "MyText",
#      :user_id => 1
#    ))
#  end
#
#  it "renders attributes in <p>" do
#    render
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/Title/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/MyText/)
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    rendered.should match(/1/)
#  end
#end

describe "posts/show.html.erb" do
  before(:each) do
    @post = assign(:post, stub_model(Post,:id=>1,:title => "Test",:description=>'Want to contribute Engines'))
  end
  it "displays the post title with description" do
    render
    rendered.should have_content("Test")
    rendered.should have_content("Want to contribute Engines")
  end

  it "displays the edit link" do
    render
    rendered.should have_selector('a',:href=>edit_post_path(@post.id),:content => 'Edit')
  end

  it "displays the back link to list the post" do
    render
    rendered.should have_selector('a',:content=>'Back',:href=>posts_path)
  end

end
