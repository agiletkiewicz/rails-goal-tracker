class RemoveColumnFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :goal_id, :integer
  end
end
