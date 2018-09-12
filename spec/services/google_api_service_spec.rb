require 'rails_helper'

describe GoogleDirectionsService do
  subject { GoogleDirectionsService.new(
    "12 Cedar Pl, Denver CO",
    "1331 17th St, Denver CO",
    "13:00"
  ) }

  it 'exists' do
    expect(subject).to be_a GoogleDirectionsService
  end

  context 'instance methods' do
    context '.trip_information' do
      it 'returns an object that contains an array of each "step" of a trip', vcr: true do
        raw_search = subject.trip_information

        expect(raw_search).to have_key :arrival_time
        expect(raw_search).to have_key :departure_time
        expect(raw_search).to have_key :distance
        expect(raw_search).to have_key :duration
        expect(raw_search).to have_key :end_address
        expect(raw_search).to have_key :start_address
        expect(raw_search).to have_key :steps
        expect(raw_search[:steps][1]).to have_key :distance
        expect(raw_search[:steps][1]).to have_key :duration
        expect(raw_search[:steps][1]).to have_key :html_instructions
        expect(raw_search[:steps][1]).to have_key :transit_details
        expect(raw_search[:steps][1]).to have_key :travel_mode
        expect(raw_search[:steps][1][:transit_details]).to have_key :arrival_stop
        expect(raw_search[:steps][1][:transit_details]).to have_key :arrival_time
        expect(raw_search[:steps][1][:transit_details]).to have_key :departure_time
        expect(raw_search[:steps][1][:transit_details]).to have_key :headsign
        expect(raw_search[:steps][1][:transit_details]).to have_key :line
        expect(raw_search[:steps][1][:transit_details]).to have_key :num_stops
        expect(raw_search[:steps][1][:transit_details][:line]).to have_key :agencies
        expect(raw_search[:steps][1][:transit_details][:line]).to have_key :color
        expect(raw_search[:steps][1][:transit_details][:line]).to have_key :name
        expect(raw_search[:steps][1][:transit_details][:line]).to have_key :short_name
        expect(raw_search[:steps][1][:transit_details][:line]).to have_key :vehicle
        expect(raw_search[:steps][1][:transit_details][:line][:vehicle]).to have_key :name
      end
    end
  end
end
