require 'spec_helper'

describe UsersController do
  describe 'routing' do
    
    it "recognizes /users/new" do
      params_from(:get, '/users/new').should == { :controller => 'users',
        :action => 'new' }
    end

  end
end
