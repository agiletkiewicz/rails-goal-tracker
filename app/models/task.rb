class Task < ApplicationRecord
    belongs_to :goal

    validates :description, :by_when, presence: true
    
    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }
    scope :today, -> {not_completed.where("tasks.by_when < ?", Time.current.tomorrow.to_date)}

    def complete?
        self.complete == true
    end

end
