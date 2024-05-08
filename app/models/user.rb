class User < ApplicationRecord
    has_secure_password

    validates :email, presence: true

    normalizes :email, with: -> email { email.strip.downcase }

    # def email=(value)
    #     super(value.strip.downcase)
    # end
end
