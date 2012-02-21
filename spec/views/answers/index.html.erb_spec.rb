require 'spec_helper'

describe "answers/index" do
  before(:each) do
    assign(:answers, [
      stub_model(Answer,
        :answer_content => "MyText",
        :user_id => 1,
        :guest_id => 1,
        :question_id => 1
      ),
      stub_model(Answer,
        :answer_content => "MyText",
        :user_id => 1,
        :guest_id => 1,
        :question_id => 1
      )
    ])
  end

  it "renders a list of answers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s
  end
end
