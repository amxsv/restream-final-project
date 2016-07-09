class Web::Admin::ApplicationController < Web::ApplicationController
  include AuthManager

  before_action :check_admin_role

  def check_admin_role
    redirect_to root_path if !authorized? || !current_user.role.manager?
  end
end
