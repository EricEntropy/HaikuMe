class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, length: { minimum: 6 }
    validates :password_confirmation, presence: true
    
    has_many :haikus
  # has_many :themes, through: :haikus

end
