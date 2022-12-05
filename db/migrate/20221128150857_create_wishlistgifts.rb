class CreateWishlistgifts < ActiveRecord::Migration[7.0]
  def change
    create_table :wishlistgifts do |t|
      t.references :gift, null: false, foreign_key: true
      t.references :event, null: false, foreign_key: true
      t.boolean :chosen

      t.timestamps
    end
  end
end
