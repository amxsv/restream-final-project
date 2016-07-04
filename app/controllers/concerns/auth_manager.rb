module AuthManager
  extend ActiveSupport::Concern

  protected

  def authorized?
    session[:user_id].present?
  end

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session[:user_id] = nil
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
