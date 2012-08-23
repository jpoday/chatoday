require 'spec_helper'

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
    
    before(:each) do
      @room_user = RoomUser.create(:user => @user, :room => @room)
    end
    
    it "should have a user association" do
      @room.should respond_to(:users)
    end
    
    it "should have the right user" do
      @room.users.should include(@user)
    end
    
    it "should destroy the associated user" do
      @room.destroy
      RoomUser.find_by_id(@room_user.id).should be_nil
    end
  end
  
  describe "comment associations" do
    
    before(:each) do
      @room.stub!(:display_comment)
      @comment = Comment.create(:content => "Hey!", :user => @user, :room => @room)
    end
    
    it "should have a comment association" do
      @room.should respond_to(:comments)
    end
    
    it "should have the right comment" do
      @room.comments.should include(@comment)
    end
    
    it "should destroy the associated comment" do
      @room.destroy
      Comment.find_by_id(@comment.id).should be_nil
    end
  end
  
  describe "interaction assocations" do
    
    before(:each) do
      @room.stub!(:display_interaction)
      @other_user = FactoryGirl.create(:user, :name => "Other")
      @interaction = Interaction.create(:subject => @user, 
                                        :verb => "high-five", 
                                        :receiver => @other_user, 
                                        :room => @room)
    end
    
    it "should have an interaction assocation" do
      @room.should respond_to(:interactions)
    end
    
    it "should have the right interaction" do
      @room.interactions.should include(@interaction)
    end
    
    it "should destroy the associated interaction" do
      @room.destroy
      Interaction.find_by_id(@interaction.id).should be_nil
    end
  end
end