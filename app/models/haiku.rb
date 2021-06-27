class Haiku < ApplicationRecord
    belongs_to :user
    has_many :haiku_themes
    has_many :themes, through: :haiku_themes

    validates :title, presence: true 
    validate :true_haiku
    
    accepts_nested_attributes_for :themes

    def themes_attributes=(theme_attributes)
        theme_attributes.values.each do |theme_attribute|
          theme = Theme.find_or_create_by(theme_attribute)
          self.themes << theme
        end
      end

    def true_haiku
      if line_1.count_syllables != 5
          errors.add(:line_1, "must be 5 syllables long")
      elsif line_2.count_syllables != 7
          errors.add(:line_2, "must be 7 syllables long")
      elsif line_3.count_syllables != 5
        errors.add(:line_3, "must be 5 syllables long")
      end 
    end 

    def content
      content = []
      content << self.line_1
      content << self.line_2
      content << self.line_3
      return content
    end 
end
