class AddCompletedDateToTasks < ActiveRecord::Migration[6.0]
  def change
    add_column :tasks, :completed_date, :datetime
  end
end
