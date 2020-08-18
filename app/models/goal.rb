class Goal < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :tasks
    has_many :notes

    validates :description, :key_result, :category_id, :by_when, presence: true

    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }

    def complete?
        self.complete == true
    end

    
end
