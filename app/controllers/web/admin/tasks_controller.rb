class Web::Admin::TasksController < Web::Admin::ApplicationController
  def index
    @user = current_user
  end
end
