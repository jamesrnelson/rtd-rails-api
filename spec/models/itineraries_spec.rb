require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  it { should belong_to :user}
  it { should validate_presence_of :user_id }
  it { should validate_presence_of :start_address }
  it { should validate_presence_of :end_address }
end
