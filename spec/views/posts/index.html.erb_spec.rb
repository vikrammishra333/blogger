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
  it "renders a list of recent posts" do
    render
#    assert_select "div.inner-content", :count => 1
#    assert_select "h2", :text => "Recent Posts".to_s, :count => 2
#    assert_select "div>div", :text => "Title".to_s, :count => 2
#    assert_select "div>div", :text => "MyText".to_s, :count => 2
    rendered.should have_selector("div.inner-content", :content => 1)
    rendered.should have_selector("div>div", :text => "Title".to_s, :count => 2)
    rendered.should have_selector("div>div", :text => "MyText".to_s, :count => 2)
    rendered.should have_selector("h2", :text => "Recent Posts".to_s, :count => 2)
  end
end
