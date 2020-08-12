class Goal < ApplicationRecord
    belongs_to :user
    has_many :tasks
    has_many :notes
    
end
