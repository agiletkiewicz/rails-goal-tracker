class Task < ApplicationRecord
    belongs_to :goal
    
    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }

    def complete?
        self.complete == 1
    end

end
