class Web::Admin::UsersController < Web::Admin::ApplicationController
  def index
    @q = User.ransack(params[:q])
    @per_page = params[:per_page] || Kaminari.config.default_per_page
    @users = @q.result.all.page(params[:page]).per(@per_page)

    @tasks_count = User.tasks_count
  end
end
