require 'test_helper'

class Web::UsersControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user_attrs = attributes_for(:user)
  end

  test 'should get index' do
    sign_in(@user)
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create user' do
    post :create, user: @user_attrs
    assert_redirected_to root_path
  end

  test 'not should create existed user' do
    post :create, user: @user.attributes
    assert_template 'new'
  end

  test 'should confirm' do
    get :confirm, token: @user.confirmation_token
    assert_redirected_to root_path
  end

  test 'should not confirm' do
    get :confirm, token: '111111111'
    assert_template 'error'
  end
end
