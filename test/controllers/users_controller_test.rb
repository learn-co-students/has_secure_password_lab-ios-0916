require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end

  def setup
    @steven = {name: 'Steven',
               password: 'un1verse',
               password_confirmation: 'un1verse'}
  end
  
  test "create creates a new user and logs them in" do
    post :create, user: @steven
    assert User.last.name == 'Steven'
  end

  test "create sets your password correctly" do
    post :create, user: @steven
    assert User.last.authenticate(@steven[:password]) == User.last
  end

  test "create logs you in" do
    post :create, user: @steven
    assert session[:user_id] == User.last.id
  end

  test "create redirects you if your password and confirmation don't match" do
    typo = @steven.merge(password_confirmation: 'uni111verse')
    post :create, user: typo
    assert_redirected_to controller: 'users', action: 'new'
  end
end
