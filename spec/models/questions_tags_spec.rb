require 'spec_helper'

describe QuestionsTags do


  before(:each) do
    @question_tag = QuestionsTags.new(:question_id => 5, :tag_id => 1)
    @tag = Tag.new(:id => 1, :title => "some title", :description => "some description")
    @question = Question.new(:id => 5, :title => "some title", :description => "some description")
  end

  it "should have a valid question" do
    
  end

end
