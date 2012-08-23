require 'spec_helper'

module ChatODay
  describe User do
    before(:each) do
      @user = User.create(:name => "Joe")
      @room = Room.create(:name => "NationBuilder Tech Test")
    end
    
    describe "room associations" do
      
      it "should have a room association" do
        @user.should respond_to(:rooms)
      end
      
      it "should have the right room" do
        @room_user = RoomUser.create(:user => @user, :room => @room)
        @user.rooms.should include(@room)
      end
    end
    
    describe "comment associations" do
      
      before(:each) do
        @room.stub!(:display_comment)
      end
      
      it "should have a comment association" do
        @user.should respond_to(:comments)
      end
      
      it "should have the right comment" do
        @comment = Comment.create(:content => "Hey!", :user => @user, :room => @room)
        @user.comments.should include(@comment)
      end
    end
  end
end