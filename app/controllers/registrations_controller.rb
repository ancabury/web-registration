class RegistrationsController < Devise::RegistrationsController
    protect_from_forgery except: [:create]
    before_filter :configure_sign_up_params

    def create
      super
    end

    private

    def after_sign_up_path_for(resource)
      users_path
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) << :phone << :address << :sex << :name
    end
end
