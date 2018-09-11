require 'rails_helper'

RSpec.describe PossibleRoute, type: :model do
  it { should belong_to :favorite }

end