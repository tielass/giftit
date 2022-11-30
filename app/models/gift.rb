class Gift < ApplicationRecord
  CATEGORY = [
    "Technology",
    "Chocolate",
    "Food",
    "Cooking",
    "Running",
    "Hiking",
    "Perfume",
    "Practical",
    "Subscriptions",
    "Wellness",
    "Yoga",
    "Wildcard"
  ]
  validates :category, inclusion: { in: CATEGORY }
  has_many :wishlistgifts
  validates :name, :price, :description, :photo, presence: true
end
