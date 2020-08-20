class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

    def ordered_open_tasks
      open_tasks = self.tasks.not_completed
      sorted = open_tasks.sort_by {|task| task.by_when}
    end

    def ordered_closed_tasks
      open_tasks = self.tasks.completed
      sorted = open_tasks.sort_by {|task| task.by_when}
    end

    def open_tasks_count
      self.tasks.not_completed.count
    end

end
