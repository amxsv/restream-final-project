class Web::UsersController < Web::ApplicationController
  skip_before_action :require_login, only: [:new, :create, :confirm, :error]

  def index
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in(@user)
      f(:success)

      @user.send_confirmation_token
      redirect_to root_path
    else
      render 'new'
    end
  end

  def confirm
    user = User.find_by_confirmation_token(params[:token])

    if user && user.confirm
      user.update confirmation_token: nil
      sign_in(user)
      redirect_to root_path
    else
      @error = 'User not found'
      render 'error'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
end
