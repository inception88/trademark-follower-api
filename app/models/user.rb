class User < ApplicationRecord
    has_secure_password
    validates :email, uniqueness: true
    has_many :follows
    has_many :trademarks, through: :follows
end
