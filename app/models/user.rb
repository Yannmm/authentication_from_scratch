class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true

    normalizes :email, with: -> email { email.strip.downcase }

    # DONE: read docs of `generates_token_for`
    generates_token_for :password_reset, expires_in: 15.minutes do
        # DONE: where is password_salt defined?
        # `attribute_salt` method is automatically generated when using `has_secure_password` 
        # @see https://github.com/rails/rails/blob/25f22503af6d9fa4fc52fd39142b9b10b73cbfda/activemodel/lib/active_model/secure_password.rb#L180
        password_salt&.last(10)
    end

    # def email=(value)
    #     super(value.strip.downcase)
    # end
end
