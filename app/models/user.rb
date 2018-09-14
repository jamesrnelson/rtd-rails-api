class User < ApplicationRecord
  has_many :itineraries
  has_many :possible_routes, through: :itineraries
  validates :email, presence: true
  validates :uid, presence: true
end
