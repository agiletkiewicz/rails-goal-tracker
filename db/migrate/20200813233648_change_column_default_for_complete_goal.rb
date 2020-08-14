class ChangeColumnDefaultForCompleteGoal < ActiveRecord::Migration[6.0]
  def change
    def up
      change_column_default :goals, :complete, true
    end
  
    def down
      change_column_default :goals, :complete, nil
    end
  end
end
