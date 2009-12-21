require 'spec_helper'

describe UserSessionsController do
  describe 'routing' do
    
    it "recognizes /login" do
      params_from(:get, '/login').should == { :controller => 'user_sessions',
        :action => 'new' }
    end

    it "generates /login" do
      route_for(:controller => 'user_sessions', 
        :action => 'new').should == '/login'
    end

  end
end
