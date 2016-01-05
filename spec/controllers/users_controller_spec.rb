require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  steven = {name: 'Steven',
            password: 'un1verse',
            password_confirmation: 'un1verse'}

  describe 'create' do
    it "creates a new user" do
      post :create, user: steven
      assert User.last.name == 'Steven'
    end

    it "logs you in" do
      post :create, user: steven
      assert session[:user_id] == User.last.id
    end

    it "sets your password if the confirmation matches" do
      post :create, user: steven
      assert User.last.authenticate(steven[:password]) == User.last
    end

    it "redirects you if your password and confirmation don't match" do
      typo = steven.merge(password_confirmation: 'uni111verse')
      post :create, user: typo
      assert_redirected_to controller: 'users', action: 'new'
    end
  end
end
