require 'spec_helper'

module ChatODay
  describe User do
    before(:each) do
      @user = User.create(:name => "Joe")
    end
    
    describe "room associations" do
      
      before(:each) do
        @room = Room.create(:name => "NationBuilder Tech Test")
        @room_user = RoomUser.create(:user => @user, :room => @room)
      end
      
      it "should have a room association" do
        @user.should respond_to(:rooms)
      end
      
      it "should have the right room" do
        @user.rooms.should include(@room)
      end
    end
  end
end