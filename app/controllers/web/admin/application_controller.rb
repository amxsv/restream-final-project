class Web::Admin::ApplicationController < Web::ApplicationController
  include AuthManager
  include FlashHelper

  layout 'admin'

  before_action :check_admin_role
  skip_before_action :check_manager_auth

  def check_admin_role
    redirect_to root_path if !authorized? || !current_user.role.manager?
  end
end
