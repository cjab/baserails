require 'spec_helper'

describe User do
  
  before(:each) do
    @valid_attributes = Factory.attributes_for(:user)
  end

  it "creates a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "requires a login" do
    User.create(@valid_attributes.merge(
      :login => nil)).should have(2).error_on(:login)
  end

  it "requires an email" do
    User.create(@valid_attributes.merge(
      :email => nil)).should have(2).error_on(:email)
  end

  it "requires a password" do
    User.create(@valid_attributes.merge(
      :password => nil)).should have(2).error_on(:password)
  end

  it "requires the password confirmation to match the password" do
    User.create(@valid_attributes.merge(
      :password_confirmation => 'alligator')).should have(1).error_on(
      :password)
  end

end
