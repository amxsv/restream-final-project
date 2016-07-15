class Web::ApplicationController < ApplicationController
  include AuthManager
  include FlashHelper

  before_action :require_login, :check_manager_auth

  helper_method :flash_messages

  def require_login
    redirect_to login_path unless authorized?
  end

  def check_manager_auth
    redirect_to admin_path if manager_auth?
  end

  def manager_auth?
    authorized? && current_user.role.manager?
  end
end
