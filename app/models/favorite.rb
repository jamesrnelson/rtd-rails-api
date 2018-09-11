class Favorite < ApplicationRecord
  belongs_to :user
  has_many :possible_routes
  validates :user_id, presence: true
  validates :title, presence: true
  validates :start_address, presence: true
  validates :end_address, presence: true

end