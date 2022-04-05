class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.integer :user_id
      t.string :opinion
      t.string :experience
      t.string :emotion
      t.string :value
      t.timestamps
    end
  end
end
