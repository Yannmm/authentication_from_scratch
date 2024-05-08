class ApplicationController < ActionController::Base
    # FIXME: ruby private method can be called from child??
    def authenticate_user!
        redirect_to root_path, alert: 'You must be logged in to do that.' unless user_signed_in?
    end


    private 

    def login(user)
        Current.user = user
        reset_session
        session[:user_id] = user.id
    end


    def logout(user)
        Current.user = nil
        reset_session
    end

    def current_user 
        Current.user ||= authenticate_user_from_session
    end

    # FIXME: what is helper method
    helper_method :current_user

    def authenticate_user_from_session
        # FIXME: diff between find_by(id: xx) and find(xx)
        User.find_by(id: session[:user_id])
    end

    def user_signed_in?
        current_user.present?
    end

    helper_method :user_signed_in?
end
