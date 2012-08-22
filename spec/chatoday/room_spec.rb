require 'spec_helper'

module ChatODay
  describe Room do
    before(:each) do
      @output = double('output').as_null_object
      @room = Room.create(:name => "NationBuilder Tech Test")
    end
    
    it "should have an 'enter' method" do
      @room.should respond_to(:enter)
    end
    
    it "should have a 'leave' method" do
      @room.should respond_to(:leave)
    end
    
    describe "user associations" do
      
      before(:each) do
        @user = User.create(:name => "Joe")
        @room_user = RoomUser.create(:user => @user, :room => @room)
      end
      
      it "should have a user association" do
        @room.should respond_to(:users)
      end
      
      it "should have the right user" do
        @room.users.should include(@user)
      end
    end
    
    
    
  end
end