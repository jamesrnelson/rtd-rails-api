class Step < ApplicationRecord
  belongs_to :possible_route
  validates :headsign, presence: true
  validates :arrival_time, presence: true
  validates :departure_time, presence: true
  validates :arrival_stop, presence: true
  validates :departure_stop, presence: true
  validates :name, presence: true
  validates :short_name, presence: true
  validates :distance, presence: true
  validates :duration, presence: true
  validates :color, presence: true
  validates :num_stops, presence: true

end