class DropNotes < ActiveRecord::Migration[6.0]
  def change
    drop_table :notes
  end
end
