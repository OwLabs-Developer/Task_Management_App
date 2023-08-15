class User < ApplicationRecord
    has_many :tasks
    has_secure_password
    validates_presence_of :username, :email, :password, :password_confirmation, uniqueness: true
end
