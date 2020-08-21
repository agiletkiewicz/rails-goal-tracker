class ChangeDefaultCompleteGoals < ActiveRecord::Migration[6.0]
  def change
    change_column_default :goals, :complete, false
  end
end
