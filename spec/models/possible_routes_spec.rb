require 'rails_helper'

RSpec.describe PossibleRoute, type: :model do
  it { should belong_to :favorite }
  it { should validate_presence_of :departure_time }
  it { should validate_presence_of :arrival_time }
  it { should validate_presence_of :duration }
  it { should validate_presence_of :distance }
end