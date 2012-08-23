require 'spec_helper'

module ChatODay
  describe Room do
    before(:each) do
      @user = User.create(:name => "Joe")
      @room = Room.create(:name => "NationBuilder Tech Test")
    end
    
    it "should have an 'enter' method" do
      @room.should respond_to(:enter)
    end
    
    it "should have a 'leave' method" do
      @room.should respond_to(:leave)
    end
    
    describe "user associations" do
      
      it "should have a user association" do
        @room.should respond_to(:users)
      end
      
      it "should have the right user" do
        @room_user = RoomUser.create(:user => @user, :room => @room)
        @room.users.should include(@user)
      end
    end
    
    describe "comment associations" do
      
      before(:each) do
        @room.stub!(:display_comment)
      end
      
      it "should have a comment association" do
        @room.should respond_to(:comments)
      end
      
      it "should have the right comment" do
        @comment = Comment.create(:content => "Hey!", :user => @user, :room => @room)
        @room.comments.should include(@comment)
      end
    end
  end
end