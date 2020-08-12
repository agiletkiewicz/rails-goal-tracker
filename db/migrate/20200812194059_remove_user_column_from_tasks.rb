class RemoveUserColumnFromTasks < ActiveRecord::Migration[6.0]
  def change
    remove_column :tasks, :user_id, :integer
  end
end
