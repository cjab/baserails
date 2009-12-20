require 'spec_helper'

describe "/users/new.html.erb" do
  include UsersHelper

  before(:each) do
    assigns[:user] = Factory.stub(:user)
  end

  it "renders the registration form" do
    render
    response.should have_tag("form[method='post'][action=?]", users_path) do
      with_tag("input#user_login[type='text'][name=?]", "user[login]")
      with_tag("input#user_email[type='text'][name=?]", "user[email]")
      with_tag("input#user_password[type='password'][name=?]", "user[password]")
      with_tag("input#user_password_confirmation[type='password'][name=?]", 
        "user[password_confirmation]")
      with_tag("input#user_submit[type='submit'][value='Register'][name=?]", 
        "commit")
    end
  end
end
