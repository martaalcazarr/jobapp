class ApplicationController < ActionController::Base
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, images_attributes: [:url, :context, :id]])
    end

    def after_sign_in_path_for(resource)
        offers_path
    end
end
