class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.text :opinion
      t.text :experience
      t.text :emotion
      t.text :value
      t.timestamps
    end
  end
end
