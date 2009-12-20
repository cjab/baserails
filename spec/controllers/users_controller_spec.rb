require 'spec_helper'

describe UsersController do
  
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end
  
  describe "new" do

    it "assigns a new user to @user" do
      User.should_receive(:new).and_return(mock_user)
      get :new
      assigns[:user].should equal(mock_user)
    end

    it "renders the registration form" do
      get :new
      should render_template(:new)
    end
  end

  describe "create" do

    describe "with valid params" do
      
      before(:each) do
        mock_user(:save => true)
        User.stub!(:new).and_return(mock_user)
      end

      it "assigns a newly created user as @user" do
        post :create, :user => Factory.attributes_for(:user)
        assigns[:user].should equal(mock_user)
      end

      it "should save the newly created user" do
        mock_user.should_receive(:save).and_return(true)
        post :create, :user => Factory.attributes_for(:user)
      end

      it "redirects to the root page" do
        post :create, :user => Factory.attributes_for(:user)
        response.should redirect_to(root_url)
      end

    end
  end
end
