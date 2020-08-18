class User < ApplicationRecord
    has_many :goals 
    has_many :tasks, through: :goals

    has_many :notes, through: :goals 

    has_many :categories, through: :goals

    has_secure_password

    validates :name, presence: true
    validates :username, presence: true

    def goal_count(category_id)
        self.goals.where(category_id: category_id).count
    end
    

end
