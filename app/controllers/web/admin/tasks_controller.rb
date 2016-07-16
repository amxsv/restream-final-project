class Web::Admin::TasksController < Web::Admin::ApplicationController
  def index
    @per_page = params[:per_page] || Kaminari.config.default_per_page
    @tasks = Task.includes(:author, :assigned_user)
                 .all
                 .page(params[:page])
                 .per(@per_page)
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    @task.author = current_user

    if @task.save
      redirect_to admin_task_path(@task.id)
    else
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to admin_task_path(@task.id)
    else
      render 'edit'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    redirect_to admin_tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :assigned_user_id)
  end
end
