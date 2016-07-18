class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @per_page = params[:per_page] || Kaminari.config.default_per_page
    @users = User.workers.page(params[:page]).per(@per_page)

    @tasks_count = User.tasks_count
  end
end
