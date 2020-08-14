class Task < ApplicationRecord
    belongs_to :goal
    
    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }
    
end
