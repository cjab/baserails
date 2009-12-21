require 'spec_helper'

describe "/user_sessions/new.html.erb" do
  include UserSessionsHelper

  before(:each) do
    activate_authlogic
    assigns[:user_session] = Factory.stub(:user_session)
  end

  it "renders the registration form" do
    render
    response.should have_tag("form[method='post'][action=?]", 
      user_session_path) do
      with_tag("input#user_session_login[type='text'][name=?]", 
        "user_session[login]")
      with_tag("input#user_session_password[type='password'][name=?]", 
        "user_session[password]")
      with_tag(
        "input#user_session_submit[type='submit'][value='Log in'][name=?]", 
        "commit")
    end
  end
end
