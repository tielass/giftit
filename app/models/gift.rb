class Gift < ApplicationRecord
  # CATEGORY = []
  # validates :category, inclusion: { in: CATEGORY }
  has_many :wishlistgifts
  validates :name, :price, :description, :photo, presence: true
end
