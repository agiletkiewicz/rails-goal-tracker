module ApplicationHelper

    def deadline(goal)
        goal.by_when.strftime("%A, %b %d")
    end

end
