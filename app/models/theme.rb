class Theme < ApplicationRecord
    validates :name, presence: true

    has_many :haiku_themes
    has_many :haikus, through: :haiku_themes
end
