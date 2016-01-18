class RegistrationsController < Devise::RegistrationsController
    protect_from_forgery except: [:create]

    def create
      binding.pry
      super
    end

    def after_sign_up_path_for(resource)
      users_path
    end
end
