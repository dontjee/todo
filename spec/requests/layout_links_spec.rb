require 'spec_helper'

describe "Layout links" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Home")
  end

  describe "when not signed in" do

    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path,
                                    :content => "Sign in")
    end

  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      integration_sign_in @user
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path,
                                    :content => "Sign out")
    end

    it "should have a profile link" do
      visit root_path
      response.should have_selector("a", :href => user_path(@user),
                                         :content => "Profile")
    end
  end
end
