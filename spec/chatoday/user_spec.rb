require 'spec_helper'

describe User do
  before(:each) do
    @user = FactoryGirl.create(:user)
    @room = FactoryGirl.create(:room)
  end
  
  describe "room associations" do
    
    before(:each) do
      @room_user = FactoryGirl.create(:room_user, :user => @user, :room => @room)
    end
    
    it "should have a room association" do
      @user.should respond_to(:rooms)
    end
    
    it "should have the right room" do
      @user.rooms.should include(@room)
    end
    
    it "should destroy associated rooms" do
      @user.destroy
      RoomUser.find_by_id(@room_user.id).should be_nil
    end
  end
  
  describe "comment associations" do
    
    before(:each) do
      @room.stub!(:display_comment)
      @comment = FactoryGirl.create(:comment, :user => @user, :room => @room)
    end
    
    it "should have a comment association" do
      @user.should respond_to(:comments)
    end
    
    it "should have the right comment" do
      @user.comments.should include(@comment)
    end
    
    it "should destroy associated comments" do
      @user.destroy
      Comment.find_by_id(@comment.id).should be_nil
    end
  end
  
  describe "high five interation" do
    
    before(:each) do
      @room.stub!(:display_interaction)
      @other_user = FactoryGirl.create(:user, :name => "Other")
    end
    
    it "should have an interacts method" do
      @user.should respond_to(:interacts)
    end
    
    it "should have an interactions association" do
      @user.should respond_to(:interactions)
    end
    
    it "should have a receivers association" do
      @user.should respond_to(:receivers)
    end
    
    it "should have an reverse_interactions association" do
      @user.should respond_to(:reverse_interactions)
    end
    
    it "should have a subjects association" do
      @user.should respond_to(:subjects)
    end
    
    context "forward interaction" do
      before(:each) do
        @interaction = Interaction.create(:subject => @user, 
                                          :verb => "high-five", 
                                          :receiver => @other_user, 
                                          :room => @room)
      end
      
      it "should have the right receiver" do
        @user.receivers.should include(@other_user)
      end
      
      it "should destroy the assocated interaction" do
        @user.destroy
        Interaction.find_by_id(@interaction.id).should be_nil
      end
    end
    
    context "reverse interaction" do
      before(:each) do
        @reverse_interaction = Interaction.create(:subject => @other_user, 
                                                  :verb => "high-five", 
                                                  :receiver => @user, 
                                                  :room => @room)
      end
      
      it "should have the right subject" do
        @user.subjects.should include(@other_user)
      end
    end
  end
end