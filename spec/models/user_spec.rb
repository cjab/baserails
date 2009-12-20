require 'spec_helper'

describe User do
  
  before(:each) do
    @valid_attributes = Factory.attributes_for(:user)
  end

  it "creates a new instance given valid attributes" do
    User.create!(@valid_attributes)
  end

  it "requires a password" do
    User.create(@valid_attributes.merge(:password => nil)).should_not be_valid
  end

  it "requires the password confirmation to match the password" do
    User.create(@valid_attributes.merge(
      :password_confirmation => 'alligator')).should_not be_valid
  end

end
