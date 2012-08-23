require 'spec_helper'

describe RoomUser do
  
  describe "associations" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @room = FactoryGirl.create(:room)
      @room_user = FactoryGirl.create(:room_user, :user => @user, :room => @room)
    end
    
    it "should have a room association" do
      @room_user.should respond_to(:room)
    end
    
    it "should have the right room" do
      @room_user.room.should == @room
    end
    
    it "should have a user assocation" do
      @room_user.should respond_to(:user)
    end
    
    it "should have the right user" do
      @room_user.user.should == @user
    end
  end
end
