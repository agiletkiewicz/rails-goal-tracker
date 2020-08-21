module ApplicationHelper

    def deadline(goal)
        goal.by_when.strftime("%A, %b %d")
        # "test"
    end

    def day_completed(goal)
        goal.completed_date.strftime("%b %e %Y")
        # "test"
    end

end
