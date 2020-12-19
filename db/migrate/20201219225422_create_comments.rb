class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :task, null: false
      t.references :user, null: false
      t.text :comment, null: false
      t.timestamps
    end
  end
end