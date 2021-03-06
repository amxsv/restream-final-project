class ApplicationController < ActionController::Base
  before_action :set_locale

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  private

  def default_url_options(options = {})
    if I18n.default_locale != I18n.locale
      { locale: I18n.locale }.merge options
    else
      { locale: nil }.merge options
    end
  end
end
