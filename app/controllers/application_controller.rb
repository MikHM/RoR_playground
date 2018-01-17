class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # TODO: need refactor, might not be best practice
  # TODO: CHECK why I can't use "before_filter" instead of "before_action" here.
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
end