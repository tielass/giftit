class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :hobbies
      t.float :price
      t.references :user, null: false, foreign_key: true
      t.string :photo

      t.timestamps
    end
  end
end
