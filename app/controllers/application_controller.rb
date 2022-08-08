# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_in_path_for(_resource_or_scope)
    user_path(current_user)
  end

  def configure_permitted_parameters
    permited_params = %i[first_name last_name email phone born_date gender]
    devise_parameter_sanitizer.permit(:sign_up, keys: permited_params)
    devise_parameter_sanitizer.permit(:sign_in, keys: permited_params)
    devise_parameter_sanitizer.permit(:account_update, keys: permited_params)
  end
end
