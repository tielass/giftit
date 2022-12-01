class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :photo
  has_many :members
  has_many :events
  has_many :voting
  devise :confirmable, :invitable
  validates :username, :email, presence: true, uniqueness: true
  has_many :events, through: :members
end
