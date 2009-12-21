require 'spec_helper'

describe UserSessionsController do
  
  def mock_user_session(stubs={})
    @mock_user_session ||= mock_model(UserSession, stubs)
  end

  describe "new" do

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
end
