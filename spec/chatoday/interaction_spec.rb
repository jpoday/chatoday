require 'spec_helper'

describe Interaction do
  
  describe "associations" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      @other_user = FactoryGirl.create(:user, :name => "Other")
      @room = FactoryGirl.create(:room)
      @room.stub!(:display_interaction)
      @interaction = Interaction.create(:subject => @user, 
                                        :verb => "high-five", 
                                        :receiver => @other_user, 
                                        :room => @room)
    end
    
    it "should have a room association" do
      @interaction.should respond_to(:room)
    end
    
    it "should have the right room" do
      @interaction.room.should == @room
    end
    
    it "should have a subject assocation" do
      @interaction.should respond_to(:subject)
    end
    
    it "should have the right subject" do
      @interaction.subject.should == @user
    end
    
    it "should have a receiver assocation" do
      @interaction.should respond_to(:subject)
    end
    
    it "should have the right receiver" do
      @interaction.receiver.should == @other_user
    end
  end
end