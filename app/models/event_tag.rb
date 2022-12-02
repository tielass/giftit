class EventTag < ApplicationRecord
  belongs_to :event
  has_many :tags
end
