require 'test_helper'

class Web::Admin::UsersControllerTest < ActionController::TestCase
  setup do
    @manager = create :user, :manager

    sign_in(@manager)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end
end
