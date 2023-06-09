class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  # GET /users/sign_up
  def new
    super
  end

  # POST /users
  def create
    super
  end

  protected

  def configure_sign_up_params
    added_attrs = [:username]
    devise_parameter_sanitizer.permit(:sign_up, keys: added_attrs)
    
  end
end

  