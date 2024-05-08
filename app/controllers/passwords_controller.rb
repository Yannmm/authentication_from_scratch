class PasswordsController < ApplicationController 
    before_action :authenticate_user!

    def edit 
    end

    def update 
        if current_user.update(password_params)
            redirect_to edit_password_path, notice: "Your password has been updated successfully."
        else
            # DONE: what is 422 unprocessable_entity
            # It means server cannot execute the instructions
            render :edit, status: :unprocessable_entity
        end
    end

    private 

    def password_params 
        params.require(:user).permit(
            :password,
            :password_confirmation,
            :password_challenge
        ).with_defaults(password_challenge: "") 
        # DONE: Force to validate old password
        # For ActionController::Parameters, merge two hashes.
    end
end