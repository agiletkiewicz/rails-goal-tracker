class Task < ApplicationRecord
    belongs_to :goal

    validates :description, :by_when, presence: true
    
    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }

    def complete?
        self.complete == true
    end

end
