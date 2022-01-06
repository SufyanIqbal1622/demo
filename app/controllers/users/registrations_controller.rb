class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]

def configure_sign_up_params
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :password_confirmation])
end


def after_sign_up_path_for(resource)
  debugger
  root_path
end

end
