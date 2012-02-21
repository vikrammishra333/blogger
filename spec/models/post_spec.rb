require 'spec_helper'

describe Post do

  it "should create a new instance given a valid attribute" do
    Post.create!(:title => 'Post title', :description => "Post description")
  end

   it "should be invalid without a title" do
    post = Post.new(:title => "")
    post.should_not be_valid
  end

  it "should require a valid description" do
    post = Post.new(:description => "")
    post.should_not be_valid
    #Post.should have(1).error_on(:title)
  end

  it "should have an error on blank title" do
     post = Post.new(:title => "")
     post.should have(1).error_on(:title)
  end

  it "should have an error on blank description" do
     post = Post.new(:description => "")
     post.should have(1).error_on(:description)
  end

  it { should belong_to(:users)}
end
