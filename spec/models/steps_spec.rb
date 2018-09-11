require 'rails_helper'

RSpec.describe Step, type: :model do
  it { should belong_to :possible_route }
  it { should validate_presence_of :distance }
  it { should validate_presence_of :duration }
end