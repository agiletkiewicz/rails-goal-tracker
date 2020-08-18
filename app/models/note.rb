class Note < ApplicationRecord
    belongs_to :goal

    validates :content, presence: true
    
end
