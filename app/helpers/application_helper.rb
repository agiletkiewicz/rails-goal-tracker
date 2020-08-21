module ApplicationHelper

    def deadline(goal)
        goal.by_when.strftime("%A, %b %d")
    end

    def day_completed(goal)
        goal.completed_date.strftime("%b %e %Y")
    end

end
