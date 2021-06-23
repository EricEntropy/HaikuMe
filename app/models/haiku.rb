class Haiku < ApplicationRecord
    validates :title, presence: true 
    validates :content, presence: true 
    validates :theme, presence: true 
    belongs_to :user
    has_many :haiku_themes
    has_many :themes, through: :haiku_themes

end
