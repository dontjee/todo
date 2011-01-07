require 'spec_helper'

describe UsersController do
  render_views

  describe "POST 'create'" do

    describe "failure" do

      before(:each) do
        @attr = { :name => "", :email => "", :password => "",
          :password_confirmation => "" }
      end

      it "should not create a user" do
        lambda do
          post :create, :user => @attr
        end.should_not change(User, :count)
      end

      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Sign up")
      end

      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end

      it "should clear the password field" do
        @attr[:password] = "test"
        post :create, :user => @attr
        
        assigns(:user).password.should == ""
      end

      it "should clear the confirmation password field" do
        @attr[:password_confirmation] = "test"
        post :create, :user => @attr
        
        assigns(:user).password_confirmation.should == ""
      end
      
    end

    describe "success" do

      before(:each) do
        @attr = { :name => "New User", :email => "user@example.com", 
                  :password => "foobar", :password_confirmation => "foobar" }
      end

      it "should create a user" do
        lambda do
          post :create, :user => @attr
        end.should change(User, :count).by(1)
      end

      it "should redirect to the user show page" do
        post :create, :user => @attr
        response.should redirect_to(user_path(assigns(:user)))
      end

      it "should have a welcome message" do
        post :create, :user => @attr
        flash[:success].should =~ /welcome/i
      end

      it "should sign the user in" do
        post :create, :user => @attr
        controller.should be_signed_in
      end

    end
  end
end
