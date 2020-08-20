class Task < ApplicationRecord
    belongs_to :goal

    validates :description, :by_when, presence: true
    
    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }
    scope :upcoming, -> {not_completed.where("tasks.by_when < ?", Time.current + (4*24*60*60))}

    def complete?
        self.complete == true
    end

end
