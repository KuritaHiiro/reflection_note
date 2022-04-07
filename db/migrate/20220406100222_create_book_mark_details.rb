class CreateBookMarkDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :book_mark_details do |t|
      t.integer :note_id
      t.integer :book_mark_id
      t.timestamps
    end
  end
end
