class ApplicationController < ActionController::Base
    
    private 
    # DONE: ruby private method can be called from child?
    # Yes, becuase the receiver of `private` method is always `self`
    def authenticate_user!
        redirect_to root_path, alert: 'You must be logged in to do that.' unless user_signed_in?
    end

    def login(user)
        reset_session
        Current.user = user
        session[:user_id] = user.id
    end


    def logout(user)
        Current.user = nil
        reset_session
    end

    def current_user 
        Current.user ||= authenticate_user_from_session
    end

    # DONE: what is helper method
    # Available to view
    helper_method :current_user

    def authenticate_user_from_session
        # DONE: diff between find_by(id: xx) and find(xx)
        # find rails error is no record found; while find_by return nil
        User.find_by(id: session[:user_id])
    end

    def user_signed_in?
        current_user.present?
    end

    helper_method :user_signed_in?
end
