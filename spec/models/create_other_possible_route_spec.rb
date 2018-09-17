require 'rails_helper'

describe CreateOtherPossibleRoute do
  context 'instance methods' do
    context '.get_new_time' do
      it 'should get new time based on 12am', vcr: true do
        itinerary = create(:itinerary)
        base_time = "12:00am"
        itinerary_params = {
          start_address: '12 Cedar Pl, Denver, CO 80230',
          end_address: '1331 17th St, Denver, CO 80230'}

        new_route = CreateOtherPossibleRoute.new(itinerary.id, itinerary_params, base_time, 15)
        expect(new_route.departure_time).to eq("0:15")
      end

      it 'should get new time based on 12pm', vcr: true do
        itinerary = create(:itinerary)
        base_time = "12:00pm"
        itinerary_params = {
          start_address: '12 Cedar Pl, Denver, CO 80230',
          end_address: '1331 17th St, Denver, CO 80230'}

        new_route = CreateOtherPossibleRoute.new(itinerary.id, itinerary_params, base_time, 15)
        expect(new_route.departure_time).to eq("12:15")
      end

      it 'should get new time based on 6am', vcr: true do
        itinerary = create(:itinerary)
        base_time = "6:00am"
        itinerary_params = {
          start_address: '12 Cedar Pl, Denver, CO 80230',
          end_address: '1331 17th St, Denver, CO 80230'}

        new_route = CreateOtherPossibleRoute.new(itinerary.id, itinerary_params, base_time, 15)
        expect(new_route.departure_time).to eq("6:15")
      end

      it 'should get new time based on 5pm', vcr: true do
        itinerary = create(:itinerary)
        base_time = "5:00pm"
        itinerary_params = {
          start_address: '12 Cedar Pl, Denver, CO 80230',
          end_address: '1331 17th St, Denver, CO 80230'}

        new_route = CreateOtherPossibleRoute.new(itinerary.id, itinerary_params, base_time, 15)
        expect(new_route.departure_time).to eq("17:15")
      end
    end
  end
end
