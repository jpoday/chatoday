require 'spec_helper'

module ChatODay
  describe Room do
    before(:each) do
      @output = double('output').as_null_object
      @room = Room.new(@output)
    end
    
    it "should have an 'enter' method" do
      @room.should respond_to(:enter)
    end
  end
end