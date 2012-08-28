require 'spec_helper'

describe Room do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @room = FactoryGirl.create(:room)
  end
  
  it "should have an 'enter' method" do
    @room.should respond_to(:enter)
  end
  
  it "should have a 'leave' method" do
    @room.should respond_to(:leave)
  end
  
  describe "user associations" do
    
    before(:each) do
      @room_user = FactoryGirl.create(:room_user, :user => @user, :room => @room)
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
      @comment = FactoryGirl.create(:comment, :user => @user, :room => @room)
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
  
  describe "history associations" do
    
    it "should have a history association" do
      @room.should respond_to(:histories)
    end
    
    it "should destroy the associated history" do
      @history = @room.histories.create(:event_type => "entrance", :event_id => @user)
      @room.destroy
      History.find_by_id(@history.id).should be_nil
    end
  end
end