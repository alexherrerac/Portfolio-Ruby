class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    # include DeviseWhiteList
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
        devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end
    ########

    # include SetSource
    before_action :set_source

    def set_source
        session[:source] = params[:q] if params[:q]
    end
    ########


    # include CurrentUserConcern
    def current_user
        super || OpenStruct.new(name: "Guest")
    end
    ########
end
