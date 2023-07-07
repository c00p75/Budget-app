class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  before_action :check_authentication # Checks authentication before each controller action
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def check_authentication
    redirect_to budget_wiz_path unless user_signed_in? || devise_controller? || request.path == budget_wiz_path
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
