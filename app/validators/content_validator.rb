require 'syllabize'

class ContentValidator < ActiveModel::Validator
    def validate(record)
        if record.content.count_syllables > 17
            record.errors[:content] << "Haikus must be 17 syllables long to be allowed in the database!"
        end 
    end 
end 

