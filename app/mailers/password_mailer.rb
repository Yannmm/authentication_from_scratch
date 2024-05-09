class PasswordMailer < ApplicationMailer
    # FIXME: Read doc of mailer
    def password_reset
        mail to: params[:user].email
    end
end
