class User < ApplicationRecord
  has_many :itineraries
  validates :email, presence: true
  validates :uid, presence: true
end
