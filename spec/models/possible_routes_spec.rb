require 'rails_helper'

Rspec.describe PossibleRoute, type: :model do
  it { should belong_to :favorite }

end