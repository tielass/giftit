class DropWishlistTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :wishlists, force: :cascade
  end
end
