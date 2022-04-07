class CreateMemos < ActiveRecord::Migration[6.1]
  def change
    create_table :memos do |t|
      t.integer :user_id
      t.integer :note_id
      t.string :memo
      t.timestamps
    end
  end
end
