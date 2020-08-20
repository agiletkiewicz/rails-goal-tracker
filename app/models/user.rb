class User < ApplicationRecord
    has_many :goals 
    has_many :tasks, through: :goals
    has_many :notes, through: :goals 
    has_many :categories, through: :goals

    has_secure_password

    validates :name, :username, presence: true
    validates :username, uniqueness: true

    def goal_count(category_id)
        self.goals.where(category_id: category_id).count
    end

    def upcoming_tasks
        self.tasks.upcoming.sort_by {|task| task.by_when}
    end

    def upcoming_tasks_count
        upcoming_tasks.count
    end

    def ordered_open_goals
        self.goals.not_completed.sort_by {|goal| goal.by_when}
      end

end
