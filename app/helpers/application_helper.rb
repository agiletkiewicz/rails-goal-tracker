module ApplicationHelper

    def deadline(goal_task)
        goal_task.by_when.strftime("%A, %b %d")
    end

    def day_completed(goal_task)
        goal_task.completed_date.strftime("%b %e %Y")
    end

end
