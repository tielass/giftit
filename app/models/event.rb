class Event < ApplicationRecord
  belongs_to :user
  has_many :members
  has_many :users, through: :members
  has_many :event_tags
  has_many :wishlistgifts, through: :wishlist
  validates_numericality_of :price, :greater_than => 0
  validates :name, :start_time, :price, presence: true
  has_one_attached :photo
  acts_as_taggable_on :tags
  # acts_as_taggable_on :hobbies

  after_create :create_chatroom

  def create_chatroom
    Chatroom.create(name: name, event_id: id)
  end
end

# @event = Event.new(name: "test", start_time: "Wed, 30 Nov 2022 11:14:00.000000000 UTC +00:00", hobbies: "test", price: 100, photo: nil)
# @event.tag_list = "tag1, tag2"
# @event.save
