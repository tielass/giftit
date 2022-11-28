class Wishlistgift < ApplicationRecord
  belongs_to :gift
  belongs_to :wishlist
end
