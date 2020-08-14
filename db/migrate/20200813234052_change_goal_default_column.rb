class ChangeGoalDefaultColumn < ActiveRecord::Migration[6.0]
  def change
    change_column_default :goals, :complete, false
    change_column_default :tasks, :complete, false
  end
end
