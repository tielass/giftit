class Event < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :wishlistgifts, through: :wishlist
  validates_numericality_of :price, :greater_than => 0
  validates :name, :start_time, :price, presence: true
  has_one_attached :photo
end
