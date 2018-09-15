class Itinerary < ApplicationRecord
  belongs_to :user
  has_many :possible_routes
  has_many :steps, through: :possible_routes
  validates :uid, presence: true
  validates :start_address, presence: true
  validates :end_address, presence: true
end
