class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary
  validates :user_id, presence: true
  validates :itinerary_id, presence: true
  validates :title, presence: true
end
