class Web::SessionController < Web::ApplicationController
  skip_before_action :require_login, only: [:new, :create]
  skip_before_action :check_manager_auth, only: [:destroy]

  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user && user.authenticate(params[:password])
      sign_in(user)
      redirect_to root_path
    else
      f(:warning)
      #flash[:warning] = t '.warning', scope: [:flash]
      redirect_to login_path
    end
  end

  def destroy
    sign_out
    redirect_to login_path
  end
end
