class User < ApplicationRecord
  has_many :itineraries
  has_many :possible_routes, through: :itineraries
  validates :username, presence: true
  validates :email, presence: true
  validates :uid, presence: true, uniqueness: true
end
