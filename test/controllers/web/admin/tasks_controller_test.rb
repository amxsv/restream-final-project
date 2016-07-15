require 'test_helper'

class Web::Admin::TasksControllerTest < ActionController::TestCase
  setup do
    @task = create :task
    @task_attrs = build(:task).attributes

    @manager = create :user, :manager
    @worker = create :user, :worker

    sign_in(@manager)
  end

  test 'should get index for manager' do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test 'should not get index for worker' do
    sign_in(@worker)

    get :index
    assert_redirected_to root_path
  end

  test 'should show task' do
    get :show, id: @task.id
    assert_response :success
  end

  test 'should new task' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @task.id
    assert_response :success
  end

  test 'should create task' do
    assert_difference('Task.count') do
      post :create, task: @task_attrs
    end

    assert_response :found
  end

  test 'should not create task' do
    assert_difference('Task.count', 0) do
      post :create, task: { title: 'test' }
    end

    assert_template :new
  end

  test 'should update task' do
    patch :update, id: @task.id, task: @task_attrs
    assert_redirected_to admin_task_path(assigns(:task))
  end

  test 'should destroy task' do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task.id
    end

    assert_redirected_to admin_tasks_path
  end
end
