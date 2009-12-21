require 'spec_helper'

describe UserSessionsController do
  
  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, stubs)
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
  end

end
