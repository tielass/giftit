class Gift < ApplicationRecord
  has_many :wishlistgifts
  validates :name, :price, :description, presence: true
  has_one_attached :photo
end
