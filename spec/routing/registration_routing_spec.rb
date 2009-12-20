require 'spec_helper'

describe UsersController do
  describe 'routing' do
    
    it "recognizes /register" do
      params_from(:get, '/register').should == { :controller => 'users',
        :action => 'new' }
    end

    it "generates /register" do
      route_for(:controller => 'users', :action => 'new').should == '/register'
    end

  end
end
