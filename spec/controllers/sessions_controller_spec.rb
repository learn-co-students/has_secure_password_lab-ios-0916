require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  connie = User.create(name: 'Connie', password: 'M4heswaran')
  
  describe 'post create' do
    it 'logs you in with the correct password' do
      post :create, user: {name: connie.name, password: connie.password}
      assert session[:user_id] == connie.id
    end

    it 'rejects invalid passwords' do
      post :create, user: {name: connie.name, password: connie.password + 'x'}
      assert session[:user_id].nil?
    end

    it 'rejects empty passwords' do
      post :create, user: {name: connie.name, password: ''}
      assert session[:user_id].nil?
    end
  end
end
