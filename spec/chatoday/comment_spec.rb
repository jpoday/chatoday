require 'spec_helper'

module ChatODay
  describe Comment do
    before(:each) do
      @output = double('output').as_null_object
      @user = User.create(:name => "Joe")
      @room = Room.create(:name => "NationBuilder Tech Test")
    end
    
    it "should require content" do
      no_content_comment = Comment.new(:user => @user, :room => @room)
      no_content_comment.should_not be_valid
    end
    
    describe "associations" do
      before(:each) do
        @room.stub!(:display_comment)
        @comment = Comment.create(:content => "Hey!", :user => @user, :room => @room)
      end
      
      it "should have a room association" do
        @comment.should respond_to(:room)
      end
      
      it "should have the right room" do
        @comment.room.should == @room
      end
      
      it "should have a user assocation" do
        @comment.should respond_to(:user)
      end
      
      it "should have the right user" do
        @comment.user.should == @user
      end
    end
  end
end