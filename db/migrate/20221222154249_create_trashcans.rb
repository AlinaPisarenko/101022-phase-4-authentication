class CreateTrashcans < ActiveRecord::Migration[7.0]
  def change
    create_table :trashcans do |t|
      t.string :location
      t.integer :user_id

      t.timestamps
    end
  end
end
