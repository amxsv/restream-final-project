class Web::Admin::DefaultController < Web::Admin::ApplicationController
  def index
    @user = User.new
  end
end
