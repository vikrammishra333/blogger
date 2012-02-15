require 'spec_helper'

describe "questions/new" do
  before(:each) do
    assign(:question, stub_model(Question,
      :title => "MyString",
      :description => "MyText",
      :views => 1,
      :user_id => 1,
      :guest_id => 1
    ).as_new_record)
  end

  it "renders new question form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => questions_path, :method => "post" do
      assert_select "input#question_title", :name => "question[title]"
      assert_select "textarea#question_description", :name => "question[description]"
      assert_select "input#question_views", :name => "question[views]"
      assert_select "input#question_user_id", :name => "question[user_id]"
      assert_select "input#question_guest_id", :name => "question[guest_id]"
    end
  end
end
