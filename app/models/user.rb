class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true

    normalizes :email, with: -> email { email.strip.downcase }

    # FIXME: read docs of `generates_token_for`
    generates_token_for :password_reset, expires_in: 15.minutes do
        # FIXME: where is password_salt defined?
        password_salt&.last(10)
    end

    # def email=(value)
    #     super(value.strip.downcase)
    # end
end
