class Step < ApplicationRecord
  belongs_to :possible_route
  validates :distance, presence: true
  validates :duration, presence: true

end