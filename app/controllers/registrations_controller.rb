class RegistrationsController < Devise::RegistrationsController
  before_action :customize_sign_up_params, only: [:create, :update]

  private
  def customize_sign_up_params
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation, :current_password) }
  end
end
