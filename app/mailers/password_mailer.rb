class PasswordMailer < ApplicationMailer
    # DONE: Read doc of mailer
    def password_reset
        mail to: params[:user].email
    end
end
