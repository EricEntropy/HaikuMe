require 'syllabize'

class Haiku < ApplicationRecord
    before_validation :true_haiku
    validates :title, presence: true 
    validates :content, presence: true 
   # belongs_to :user
    has_many :haiku_themes
    has_many :themes, through: :haiku_themes
    accepts_nested_attributes_for :themes

    def themes_attributes=(theme_attributes)
        theme_attributes.values.each do |theme_attribute|
          theme = Theme.find_or_create_by(theme_attribute)
          self.themes << theme
        end
      end

      private 

      def true_haiku
        if self.content.count_syllables > 17 
          return false
        end 
      end 

end
