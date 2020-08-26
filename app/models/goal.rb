class Goal < ApplicationRecord
    belongs_to :user
    belongs_to :category

    has_many :tasks
    has_many :notes

    scope :completed, -> { where(complete: true) }
    scope :not_completed, -> { where(complete: false) }

    validates_date :by_when, on: :create, :on_or_after => lambda { Date.current }  
    validates :description, :key_result, :category_id, :by_when, presence: true


    def complete?
        self.complete == true
    end
    
end
