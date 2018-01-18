module DeviseWhitelist
  extend ActiveSupport::Concern

  included do
    # TODO: Why can't I use "before_filter" here instead of "before_action" 
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end