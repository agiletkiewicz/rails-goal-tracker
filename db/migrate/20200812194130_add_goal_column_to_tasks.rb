class AddGoalColumnToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :goal_id, :integer
  end
end
