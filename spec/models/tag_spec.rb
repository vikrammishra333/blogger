require 'spec_helper'


describe Tag do

  it { should have_and_belong_to_many(:questions)}

  it "should create a new instance given a valid attribute" do
    Tag.create!(:title => 'Tag title', :description => "tag description")
  end

  it "should be invalid without a title" do
    tag = Tag.new(:title => "")
    tag.should_not be_valid
  end

  it "should require a valid description" do
    tag = Tag.new(:description => "")
    tag.should_not be_valid
    #tag.should have(1).error_on(:title)
  end

  it "should have an error on title" do
     tag = Tag.new(:title => "")
     tag.should have(1).error_on(:title)
  end

  it "should have an error on description" do
     tag = Tag.new(:description => "")
     tag.should have(1).error_on(:description)
  end

  ## test for has and belongs to many
  
  it "should have one or more questions" do
    @tag  = Tag.create(:title  => 'tag title', :description => "tag title description")
    @question1 = Question.create(:title  => 'question title', :description => "question title description")
    
    
    @tag.questions << @question1
    @tag.questions.count.should >= 1
    #@question.tags.count.should >= 1
    @tag.questions.first.should == @question1
    #@question.tags.first.should == @tag
  end
  

end
