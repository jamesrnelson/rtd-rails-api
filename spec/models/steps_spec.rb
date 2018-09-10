require 'rails_helper'

Rspec.describe Step, type: :model do
  it { should belong_to :possible_route }
  it { should validate_presence_of :headsign }
  it { should validate_presence_of :arrival_time }
  it { should validate_presence_of :departure_time }
  it { should validate_presence_of :arrival_stop }
  it { should validate_presence_of :departure_stop }
  it { should validate_presence_of :name}
  it { should validate_presence_of :short_name}
  it { should validate_presence_of :distance }
  it { should validate_presence_of :duration }
  it { should validate_presence_of :color }
end