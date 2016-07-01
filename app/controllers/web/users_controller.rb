class Web::UsersController < Web::ApplicationController
  def index
    @user = User.new
  end

  def login
    @user = User.authenticate(params[:email], params[:password])
    if @user
      sign_in(@user)
      redirect_to '/users/show'
    else
      render 'index'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      sign_in(@user)
      redirect_to '/users/show'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(session[:user_id])
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :encrypted_password)
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
