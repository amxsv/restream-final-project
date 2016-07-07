require 'test_helper'

class Web::SessionControllerTest < ActionController::TestCase
  setup do
    @user = create :user
    @user_attrs = attributes_for(:user)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create' do
    post :create, email: @user.email, password: @user.password

    assert_not_nil current_user
    assert_equal authorized?, true
    assert_redirected_to root_path
  end

  test 'not should create' do
    post :create, email: @user_attrs[:email], password: @user.password
    assert_redirected_to login_path
  end

  test 'should destroy' do
    get :destroy
    assert_nil current_user
    assert_redirected_to login_path
  end
end
