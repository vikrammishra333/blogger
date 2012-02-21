require 'spec_helper'

describe Question do

  it "should create a new instance given a valid attribute" do
    Question.create!(:title => 'Question title', :description => "question description")
  end

  it "should be invalid without a title" do
    question = Question.new(:title => "")
    question.should_not be_valid
  end

  it "should be invalid without a description" do
    question = Question.new(:description => "")
    question.should_not be_valid
    #question.should have(1).error_on(:title)
  end

  it "should have an error on title" do
     question = Question.new(:title => "")
     question.should have(1).error_on(:title)
  end

  it "should have an error on description" do
     question = Question.new(:description => "")
     question.should have(1).error_on(:description)
  end

   ## test for has and belongs to many

  it "should have one or more tags" do
    @tag  = Tag.create(:title  => 'tag title', :description => "tag title description")
    @question = Question.create(:title  => 'question title', :description => "question title description")
    @question.tags << @tag
    @question.tags.count.should >= 1
    @question.tags.first.should == @tag
  end

  describe "answer associations" do

    before(:each) do
      @question = Question.create(:title => "title", :description => "description")
      @ans1 = Answer.create(:question_id => @question.id)
      @ans2 = Answer.create(:question_id => @question.id)
    end

    it "should have an answer attribute" do
      @question.should respond_to(:answers)
    end
    
    it "should destroy associated answers" do
      @question.destroy
      [@ans1, @ans2].each do |answer|
        Answer.find_by_id(answer.id).should be_nil
      end
    end

    it { should have_many(:answers)}

    it { should have_and_belong_to_many(:tags)}

  end
  
end
