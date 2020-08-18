class Category < ApplicationRecord
    has_many :goals 
    has_many :users, through: :goals

    def goal_count(user)
        self.goals.where(user_id: user.id).count
    end

end
