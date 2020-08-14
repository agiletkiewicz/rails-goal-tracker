class Goal < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :tasks
    has_many :notes

    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }

    def ordered_open_tasks
        open_tasks = self.tasks.not_completed
        sorted = open_tasks.sort_by {|task| task.by_when}
    end
    
end
