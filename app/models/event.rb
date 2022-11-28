class Event < ApplicationRecord
  CATEGORY = []
  belongs_to :user
  has_many :members, :wishlists
  validates_numericality_of :price, :greater_than => 0
  validates :name, :date, :price, presence: true
  validates :category, inclusion: { in: CATEGORY }
  has_one_attached :photo
end
