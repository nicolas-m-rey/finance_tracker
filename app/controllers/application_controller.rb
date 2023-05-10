class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_actrion :configure_permitted_parameters, if: :devise_controller?
  respond_to :html, :json, :js 

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end
end
