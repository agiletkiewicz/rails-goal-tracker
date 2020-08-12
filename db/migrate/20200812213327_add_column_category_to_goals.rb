class AddColumnCategoryToGoals < ActiveRecord::Migration[6.0]
  def change
    add_column :goals, :category_id, :integer
  end
end
