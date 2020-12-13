class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.date :deadline
      t.timestamps
    end
  end
end
