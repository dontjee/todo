require 'spec_helper'

describe Item do

  before(:each) do
    @user = Factory(:user)
    @attr = {
      :text => "dummy item",
    }
  end

  it "should create a new instance given valid attributes" do
    @user.items.create!(@attr)
  end

  describe "user associations" do

    before(:each) do
      @item = @user.items.create(@attr)
    end

    it "should have a user attribute" do
      @item.should respond_to(:user)
    end

    it "should have the right user associated" do
      @item.user_id.should == @user.id
      @item.user.should == @user
    end
  end
end
