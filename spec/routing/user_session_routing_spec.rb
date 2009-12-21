require 'spec_helper'

describe UsersController do
  describe 'routing' do
    
    it "recognizes /user_session/new" do
      params_from(:get, '/user_session/new').should == { 
        :controller => 'user_sessions',
        :action => 'new' }
    end

    it "recognizes POST /user_session" do
      params_from(:post, '/user_session').should == {
        :controller => 'user_sessions',
        :action => 'create' }
    end

  end
end
