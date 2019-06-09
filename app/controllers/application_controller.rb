class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  def change_locale
    #l = params[:locale].to_s.strip.to_sym
    #I18n.locale = l
  end
end
