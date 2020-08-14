class Goal < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :tasks
    has_many :notes

    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }
    
end
