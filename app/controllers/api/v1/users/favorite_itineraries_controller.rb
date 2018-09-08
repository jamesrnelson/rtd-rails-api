class Api::V1::Users::FavoriteItinerariesController < ApiController
  def index
    favorites = [
      {
        'name': 'Commute',
        'origin': 'Alameda Ave & Fairmount Drive',
        'terminus': '18th St & Larimer St',
        'departs': '7:29 AM',
        'arrives': '8:13 AM',
        'legs': [
          {
            'transit_route': '3',
            'direction': 'Federal Center',
            'stops': [
              {
                'stop_name': 'Alameda Ave & Fairmount Drive',
                'time': '7:29 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Quebec St',
                'time': '7:31 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Olive Way',
                'time': '7:31 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Niagara St',
                'time': '7:32 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Monaco Pkwy',
                'time': '7:33 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Kearney St',
                'time': '7:33 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Holly St',
                'time': '7:34 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Forest St',
                'time': '7:35 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Dahlia St',
                'time': '7:36 AM'
              },
              {
                'stop_name': 'Alameda Ave & Leetsdale Dr',
                'time': '7:38 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Colorado Blvd Nearside',
                'time': '7:38 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Colorado Blvd Farside',
                'time': '7:39 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Monroe St',
                'time': '7:39 AM'
              },
              {
                'stop_name': 'S Adams St & Ellsworth Ave',
                'time': '7:41 AM'
              },
              {
                'stop_name': 'Steele St & Ellsworth Ave',
                'time': '7:41 AM'
              },
              {
                'stop_name': '1st Ave & Milwaukee St',
                'time': '7:42 AM'
              },
              {
                'stop_name': '1st Ave & Fillmore Plaza',
                'time': '7:42 AM'
              },
              {
                'stop_name': 'University Blvd & 1st Ave',
                'time': '7:44 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Vine St',
                'time': '7:46 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Williams St',
                'time': '7:46 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Downing St',
                'time': '7:47 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Emerson St',
                'time': '7:48 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Pearl St',
                'time': '7:49 AM'
              },
              {
                'stop_name': 'Alameda Ave & S Lincoln St',
                'time': '7:50 AM'
              }
            ]
          },
          {
            'transit_route': '0',
            'direction': 'Union Station',
            'stops': [
              {
                'stop_name': 'S Lincoln St & Bayaud Ave',
                'time': '7:58 AM'
              },
              {
                'stop_name': 'Lincoln St & 1st Ave',
                'time': '7:59 AM'
              },
              {
                'stop_name': 'Lincoln St & 4th Ave',
                'time': '8:00 AM'
              },
              {
                'stop_name': 'Lincoln St & 5th Ave',
                'time': '8:00 AM'
              },
              {
                'stop_name': 'Lincoln St & 7th Ave',
                'time': '8:01 AM'
              },
              {
                'stop_name': 'Lincoln St & 9th Ave',
                'time': '8:02 AM'
              },
              {
                'stop_name': 'Lincoln St & 11th Ave',
                'time': '8:03 AM'
              },
              {
                'stop_name': 'Lincoln St & 13th Ave',
                'time': '8:04 AM'
              },
              {
                'stop_name': 'Colfax Ave & Broadway',
                'time': '8:06 AM'
              },
              {
                'stop_name': '15th St & Cleveland Pl',
                'time': '8:06 AM'
              },
              {
                'stop_name': 'Welton St & 16th Street Mall',
                'time': '8:09 AM'
              },
              {
                'stop_name': '18th St & Stout St',
                'time': '8:11 AM'
              },
              {
                'stop_name': '18th St & Arapahoe St',
                'time': '8:12 AM'
              },
              {
                'stop_name': '18th St & Larimer St',
                'time': '8:13 AM'
              }
            ]
          }
        ]
      }
    ]

    render json: favorites
  end
end
