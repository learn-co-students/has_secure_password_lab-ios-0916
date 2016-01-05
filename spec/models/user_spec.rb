require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a password field' do
    assert_respond_to User.new, :password
  end

  it 'has a name field' do
    assert_respond_to User.new, :name
  end

  it 'has a password confirmation field' do
    assert_respond_to User.new, :password_confirmation
  end

  it 'is valid if password and password_confirmation match' do
    user = User.new
    user.password = user.password_confirmation = 'foo'
    assert user.valid?    
  end

  it 'is valid if password is set and password_confirmation is nil' do
     user = User.new
     user.password = 'foo'
     assert user.valid?
  end

  it "is invalid if password and password_confirmation are both non-nil and don't match" do
    user = User.new
    user.password = 'foo'
    user.password_confirmation = 'fo0'
    refute user.valid?
  end

  describe 'authenticate' do
    it 'returns the user if credentials match' do
      user = User.new
      user.password = 'foo'
      assert user.authenticate('foo') == user
    end

    it "returns falsey if credentials don't match" do
      user = User.new
      user.password = 'foo'
      refute user.authenticate('fo0')
    end
  end
end
