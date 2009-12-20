require 'spec_helper'

describe UsersController do
  
  def mock_user(stubs={})
    @mock_user ||= mock_model(User, stubs)
  end
  
  describe "new:"

    it "should assign a new user to @user" do
      User.should_receive(:new).and_return(mock_user)
      get :new
      assigns[:user].should equal(mock_user)
    end

    it "should render the registration form" do
      get :new
      should render_template(:new)
    end

end
