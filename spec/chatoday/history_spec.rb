require 'spec_helper'

describe History do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @room = FactoryGirl.create(:room)
  end

  describe "associations" do
    before(:each) do
      @history = History.create(:event_type => "entrance", :event_id => @user, :room => @room)
    end
    
    it "should have a room association" do
      @history.should respond_to(:room)
    end
    
    it "should have the right room" do
      @history.room.should == @room
    end
    
    it "should have an event assocation" do
      @history.should respond_to(:event_id)
    end
  end
end