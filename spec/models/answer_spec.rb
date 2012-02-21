require 'spec_helper'

describe Answer do

  before(:each) do
   @question = Question.create!(:title => 'Question title', :description => "question description")
   
  end

  describe "validations" do

    it "should create a new instance given a valid attribute" do
      Answer.create!(:answer_content => "answer to the question", :question_id => @question)
    end

    it "should be invalid without a question id" do
      Answer.new(:answer_content => "answer to the question", :question_id => "").should_not be_valid
    end

   it "should require nonblank content" do
      Answer.new(:question_id => @question).should_not be_valid
    end

   
  end

  it { Answer.new.should belong_to(:questions)}
end
