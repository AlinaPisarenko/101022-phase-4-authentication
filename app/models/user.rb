class User < ApplicationRecord
    has_secure_password
    has_many :trashcans

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :email, uniqueness: true
    # validates :password, length: { in: 6..20 }
end
