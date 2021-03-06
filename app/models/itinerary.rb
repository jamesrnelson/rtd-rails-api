class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :possible_routes
  has_many :steps, through: :possible_routes
  validates :start_address, presence: true
  validates :end_address, presence: true
end
