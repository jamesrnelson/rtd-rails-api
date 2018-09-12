class PossibleRoute < ApplicationRecord
  belongs_to :itinerary
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :duration, presence: true
  validates :distance, presence: true
end
