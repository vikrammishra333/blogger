require 'spec_helper'
#
#describe "posts/new" do
#  before(:each) do
#    assign(:post, stub_model(Post,
#      :title => "MyString",
#      :description => "MyText",
#      :user_id => 1
#    ).as_new_record)
#  end
#
#  it "renders new post form" do
#    render
#
#    # Run the generator again with the --webrat flag if you want to use webrat matchers
#    assert_select "form", :action => posts_path, :method => "post" do
#      assert_select "input#post_title", :name => "post[title]"
#      assert_select "textarea#post_description", :name => "post[description]"
#      assert_select "input#post_user_id", :name => "post[user_id]"
#    end
#  end
#end
require 'spec_helper'

describe "posts/new.html.erb" do
  before(:each) do
   #@post = assign(:post, stub_model(Post)).as_new_record.as_null_object
   assign(:post, Factory.create(:post))
  end
  it "renders the form partial" do
    render
    rendered.should have_selector('form',:method => "post",:action => posts_path) do |form|
      form.should have_selector('label',:for=>'post_title',:content=>'Title')
      form.should have_selector('input',:type => "text",:name=>'post[title]',:id=>'post_title')
      form.should have_selector('label',:for=>'post_description',:content=>'Description')
      form.should have_selector('textarea',:cols=>'40',:rows=>'20',:name=>'post[description]',:id=>'post_description')
      form.should have_selector('input',:type=>'submit',:value=>'Publish')
    end
  end

end
