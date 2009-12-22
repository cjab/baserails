require 'spec_helper'

describe UserSessionsController do
  
  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, stubs)
  end

  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end

  describe "#new" do
    it "assigns a new user session to @user_session" do
      UserSession.should_receive(:new).and_return(mock_user_session)
      get :new
      assigns[:user_session].should equal(mock_user_session)
    end

    it "renders the login form" do
      get :new
      should render_template(:new)
    end
  end


  describe "#create" do
    describe "with valid params" do
      before(:each) do
        mock_user_session(:save => true)
        UserSession.stub!(:new).and_return(mock_user_session)
      end

      it "assigns a new user session @user_session" do
        post :create, :user_session => Factory.attributes_for(:user)
        assigns[:user_session].should equal(mock_user_session)
      end

      it "redirects to the root page" do
        post :create, :user_session => Factory.attributes_for(:user_session)
        response.should redirect_to(root_url)
      end

      it "displays a success message" do
        post :create, :user_session => Factory.attributes_for(:user_session)
        flash[:notice].should == 'Logged in successfully!'
      end
    end

    describe "with invalid params" do
      before(:each) do
        mock_user_session(:save => false)
        UserSession.stub!(:new).and_return(mock_user_session)
      end

      it "re-renders the new template" do
        post :create, :user_session => Factory.attributes_for(:user_session)
        response.should render_template('new')
      end

      it "displays an error message" do
        post :create, :user_session => Factory.attributes_for(:user_session)
        flash[:error].should == 'Failed to log in!'
      end
    end
  end


  describe "#destroy" do
    before(:each) do
      activate_authlogic
      UserSession.stub!(:find).and_return(mock_user_session)
      mock_user_session.stub!(:user).and_return(mock_user)
      mock_user_session.stub!(:destroy)
    end

    it "should destroy the session" do
      mock_user_session.should_receive(:destroy)
      post :destroy
    end

    it "should redirect to the login page" do
      post :destroy
      response.should redirect_to(login_url)
    end

    it "should display success message" do
      post :destroy
      flash[:notice].should == "Logged out successfully!"
    end
  end

end
