class Gift < ApplicationRecord
  has_many :wishlistgifts
  validates :name, :price, :description, :photo, presence: true
end
