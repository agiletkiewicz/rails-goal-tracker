module ApplicationHelper

    def deadline(goal)
        goal.by_when.strftime("%A, %b %d")
    end

    def current_user 
        User.find_by(id: session[:user_id])
    end

end
