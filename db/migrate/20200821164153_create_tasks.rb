class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :description
      t.boolean :complete
      t.datetime :by_when
      t.integer :goal_id
      t.datetime :completed_date
    end
  end
end
