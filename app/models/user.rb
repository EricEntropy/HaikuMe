class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: true

    has_many :haikus
   # has_many :themes, through :haikus NOT YET

end
