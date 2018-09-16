class StepSerializer < ActiveModel::Serializer
  attributes  :id, :headsign, :short_name, :name, :distance, :duration,
              :arrival_time, :departure_time, :arrival_stop, :departure_stop,
              :instructions, :color, :vehicle_type, :credit_name, :credit_url,
              :instructions, :travel_mode, :num_stops
end
