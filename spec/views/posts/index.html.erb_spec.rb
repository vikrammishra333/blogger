require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :description => "MyText",
        :user_id => 1
      ),
      stub_model(Post,
        :title => "Title",
        :description => "MyText",
        :user_id => 1
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div>div", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "div>div", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    #assert_select "div>div", :text => 1.to_s, :count => 2
  end
end
