class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :goal_id
      t.text :content

      t.timestamps
    end
  end
end
