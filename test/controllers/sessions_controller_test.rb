require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  def setup
    @connie = User.create(name: 'Connie', password: 'M4heswaran')
  end
  
  test 'post create should log you in with the correct password' do
    post :create, user: {name: @connie.name, password: @connie.password}
    assert session[:user_id] == @connie.id
  end

  test 'post create should reject invalid passwords' do
    post :create, user: {name: @connie.name, password: @connie.password + 'x'}
    assert session[:user_id].nil?
  end

  test 'post create should reject empty passwords' do
    post :create, user: {name: @connie.name, password: ''}
    assert session[:user_id].nil?
  end
end
