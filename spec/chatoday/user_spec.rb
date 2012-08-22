require 'spec_helper'

module ChatODay
  describe User do
    before(:each) do
      @user = User.new('Joe')
    end
    
    it "should have an 'name' method" do
      @user.should respond_to(:name)
    end
  end
end