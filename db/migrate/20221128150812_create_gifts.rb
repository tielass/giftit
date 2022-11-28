class CreateGifts < ActiveRecord::Migration[7.0]
  def change
    create_table :gifts do |t|
      t.string :name
      t.float :price
      t.string :photo
      t.text :description
      t.string :link

      t.timestamps
    end
  end
end
