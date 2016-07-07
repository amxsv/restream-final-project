class Web::ApplicationController < ApplicationController
  include AuthManager

  before_action :require_login

  def require_login
    redirect_to login_path unless authorized?
  end
end
