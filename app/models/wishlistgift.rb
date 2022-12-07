class Wishlistgift < ApplicationRecord
  belongs_to :gift
  belongs_to :event
  has_many :votings
end
