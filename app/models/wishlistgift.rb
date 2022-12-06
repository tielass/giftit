class Wishlistgift < ApplicationRecord
  belongs_to :gift
  belongs_to :event
  # validates :gift_id, uniqueness: true
end
