class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :task_id
      t.text :description
      t.text :key_result
      t.datetime :completed_date
      t.boolean :complete
      t.datetime :by_when
      t.string :nickname

      t.timestamps
    end
  end
end
