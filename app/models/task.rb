class Task < ApplicationRecord
    belongs_to :goal

    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }
    scope :upcoming, -> { not_completed.where("tasks.by_when < ?", Time.current + (4*24*60*60)) }

    validates_date :by_when, :on_or_after => lambda { Date.current }  
    validates :description, :by_when, presence: true

    def complete?
        self.complete == true
    end

end
