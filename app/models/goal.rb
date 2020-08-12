class Goal < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :tasks
    has_many :notes
    
end
