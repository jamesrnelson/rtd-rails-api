class PossibleRoute < ApplicationRecord
  belongs_to :itinerary
  has_many :steps, dependent: :destroy
  validates :departure_time, presence: true
  validates :arrival_time, presence: true
  validates :duration, presence: true
  validates :distance, presence: true
end
