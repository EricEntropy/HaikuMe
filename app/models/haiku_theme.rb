class HaikuTheme < ApplicationRecord
    belongs_to :haiku 
    belongs_to :theme
end
