require 'spec_helper'

describe "answers/new" do
  before(:each) do
    assign(:answer, stub_model(Answer,
      :answer_content => "MyText",
      :user_id => 1,
      :guest_id => 1,
      :question_id => 1
    ).as_new_record)
  end

  it "renders new answer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => answers_path, :method => "post" do
      assert_select "textarea#answer_answer_content", :name => "answer[answer_content]"
      assert_select "input#answer_user_id", :name => "answer[user_id]"
      assert_select "input#answer_guest_id", :name => "answer[guest_id]"
      assert_select "input#answer_question_id", :name => "answer[question_id]"
    end
  end
end
