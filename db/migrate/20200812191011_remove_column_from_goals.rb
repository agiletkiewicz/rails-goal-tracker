class RemoveColumnFromGoals < ActiveRecord::Migration[6.0]
  def change
    remove_column :goals, :task_id, :integer
  end
end
