# RTD Revamp

This API is part of a module 4 capstone project at the Turing School of Software and Design.

The rails back end implements the Google Directions API and persists users to the database along with the user's

"favorite" iteneraries.

The front end repository for this project is available [here](https://github.com/Awiedenman/rtd-mobile-app).

The back end is deployed on heroku [here](http://rtd-revamp-api.herokuapp.com/api/v1/users/5EBOVldwsGY7q70GC90NrApjUrj1/itineraries).

(Note: Since all endpoints require a hashed user id from firebase, the link above points to a specific user's itineraries.)

## Ruby and Rails Versions

* Ruby version: 2.5.0

* Rails version: 5.2.1

## Project management

* [Waffle board](https://waffle.io/jamesrnelson/rtd-rails-api)

## Set up and Use

* Set up the backend by cloning down the repo and following standard Rails setup procedure

```shell
git clone git@github.com:jamesrnelson/rtd-rails-api.git
```

```shell
bundle install && bundle update
```

#### Create, Migrate, and Seed the Databases
```shell
rake db:create
rake db:migrate
rake db:seed
```

* In your local backend directory, run the server on http://localhost:3000 by running the following command:

```shell
rails server
```

* In another window, still in your local backend directory, ensure that redis is running:

```shell
redis-server
```

* If you do not already have redis you can get it by running:

```shell
brew install redis
```

* In a third window, still in your local backend directory, run sidekiq:

```shell
bundle exec sidekiq
```

#### How to run the test suite

The RTD Revamp Rails API was thoroughly tested using RSpec. In order to run the tests, make sure that you have already followed the steps about creating and migrating your database, then from your backend root directory run the following test command:

```shell
rspec
```
#### Continuous Integration

The RTD Revamp Rails API was developed with Travis CI to ensure all deploys were fully functional.

## Supported Endpoints:

#### POST /api/v1/users/:uid/itineraries

Returns the next four departure times for the start address and end address indicated in the post request.

In the body of the post request, include a JSON object that includes the following parameters: start_address, end_address. Additional optional parameters are: departure_time OR arrival_time. (Do not include both parameters.) Time should be a represented as a string using 24-hour time (see example below).

```shell
{
    "start_address": "Union Station, Denver, CO",
    "end_address": "750 Colorado Blvd, Denver, CO 80206",
    "departure_time": "15:00"
}
```

The returned object has the following format:

```shell
[
    {
        "itinerary_id": 38,
        "start_address": "LoDo, Denver, CO 80202, USA",
        "end_address": "S Wadsworth Blvd, Lakewood, CO, USA",
        "favorite": false,
        "departure_time": "4:34pm",
        "arrival_time": "5:29pm",
        "duration": "55 mins",
        "distance": "11.7 mi",
        "title": null,
        "steps": [
            {
                "id": 1479,
                "possible_route_id": 373,
                "headsign": "Free MallRide Civic Center",
                "arrival_time": "4:48pm",
                "departure_time": "4:34pm",
                "arrival_stop": "Civic Center Station Mall Alighting",
                "departure_stop": "16th St Mall & Wewatta St",
                "name": "Free Mall Ride",
                "short_name": "MALLRIDE",
                "instructions": "Bus towards Free MallRide Civic Center",
                "distance": "1.1 mi",
                "duration": "13 mins",
                "color": "#5c6bc0",
                "num_stops": 17,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1480,
                "possible_route_id": 373,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to Civic Center Station Gate 1",
                "distance": "144 ft",
                "duration": "1 min",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            },
            {
                "id": 1481,
                "possible_route_id": 373,
                "headsign": "Wadsworth-Hampden PnR",
                "arrival_time": "5:27pm",
                "departure_time": "4:53pm",
                "arrival_stop": "S Wadsworth Blvd & W Yale Ave",
                "departure_stop": "Civic Center Station Gate 1",
                "name": "South Wadsworth Limited",
                "short_name": "87L",
                "instructions": "Bus towards Wadsworth-Hampden PnR",
                "distance": "10.5 mi",
                "duration": "35 mins",
                "color": "#0277bd",
                "num_stops": 25,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1482,
                "possible_route_id": 373,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to S Wadsworth Blvd, Lakewood, CO, USA",
                "distance": "66 ft",
                "duration": "1 min",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            }
        ]
    },
    {
        "itinerary_id": 38,
        "start_address": "LoDo, Denver, CO 80202, USA",
        "end_address": "S Wadsworth Blvd, Lakewood, CO, USA",
        "favorite": false,
        "departure_time": "4:47pm",
        "arrival_time": "5:50pm",
        "duration": "1 hour 3 mins",
        "distance": "11.2 mi",
        "title": null,
        "steps": [
            {
                "id": 1483,
                "possible_route_id": 374,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to 15th - Delgany",
                "distance": "0.2 mi",
                "duration": "4 mins",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            },
            {
                "id": 1484,
                "possible_route_id": 374,
                "headsign": "Wadsworth",
                "arrival_time": "5:12pm",
                "departure_time": "4:51pm",
                "arrival_stop": "W 26th Ave & Wadsworth Blvd",
                "departure_stop": "15th - Delgany",
                "name": "28th Avenue",
                "short_name": "28",
                "instructions": "Bus towards Wadsworth",
                "distance": "4.5 mi",
                "duration": "21 mins",
                "color": "#0277bd",
                "num_stops": 24,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1485,
                "possible_route_id": 374,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to Wadsworth Blvd & W 26th Ave",
                "distance": "427 ft",
                "duration": "2 mins",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            },
            {
                "id": 1486,
                "possible_route_id": 374,
                "headsign": "SW Plaza",
                "arrival_time": "5:49pm",
                "departure_time": "5:19pm",
                "arrival_stop": "S Wadsworth Blvd & W Yale Ave",
                "departure_stop": "Wadsworth Blvd & W 26th Ave",
                "name": "Wadsworth Blvd",
                "short_name": "76",
                "instructions": "Bus towards SW Plaza",
                "distance": "6.4 mi",
                "duration": "30 mins",
                "color": "#0277bd",
                "num_stops": 32,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1487,
                "possible_route_id": 374,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to S Wadsworth Blvd, Lakewood, CO, USA",
                "distance": "66 ft",
                "duration": "1 min",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            }
        ]
    },
    {
        "itinerary_id": 38,
        "start_address": "LoDo, Denver, CO 80202, USA",
        "end_address": "S Wadsworth Blvd, Lakewood, CO, USA",
        "favorite": false,
        "departure_time": "5:09pm",
        "arrival_time": "6:02pm",
        "duration": "53 mins",
        "distance": "11.7 mi",
        "title": null,
        "steps": [
            {
                "id": 1488,
                "possible_route_id": 375,
                "headsign": "Free MallRide Civic Center",
                "arrival_time": "5:22pm",
                "departure_time": "5:09pm",
                "arrival_stop": "Civic Center Station Mall Alighting",
                "departure_stop": "16th St Mall & Wewatta St",
                "name": "Free Mall Ride",
                "short_name": "MALLRIDE",
                "instructions": "Bus towards Free MallRide Civic Center",
                "distance": "1.1 mi",
                "duration": "13 mins",
                "color": "#5c6bc0",
                "num_stops": 17,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1489,
                "possible_route_id": 375,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to Civic Center Station Gate 1",
                "distance": "144 ft",
                "duration": "1 min",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            },
            {
                "id": 1490,
                "possible_route_id": 375,
                "headsign": "Wadsworth-Hampden PnR",
                "arrival_time": "6:00pm",
                "departure_time": "5:27pm",
                "arrival_stop": "S Wadsworth Blvd & W Yale Ave",
                "departure_stop": "Civic Center Station Gate 1",
                "name": "South Wadsworth Limited",
                "short_name": "87L",
                "instructions": "Bus towards Wadsworth-Hampden PnR",
                "distance": "10.5 mi",
                "duration": "34 mins",
                "color": "#0277bd",
                "num_stops": 25,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1491,
                "possible_route_id": 375,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to S Wadsworth Blvd, Lakewood, CO, USA",
                "distance": "66 ft",
                "duration": "1 min",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            }
        ]
    },
    {
        "itinerary_id": 38,
        "start_address": "LoDo, Denver, CO 80202, USA",
        "end_address": "S Wadsworth Blvd, Lakewood, CO, USA",
        "favorite": false,
        "departure_time": "5:22pm",
        "arrival_time": "6:24pm",
        "duration": "1 hour 1 min",
        "distance": "11.9 mi",
        "title": null,
        "steps": [
            {
                "id": 1492,
                "possible_route_id": 376,
                "headsign": "Free MallRide Civic Center",
                "arrival_time": "5:28pm",
                "departure_time": "5:22pm",
                "arrival_stop": "16th Street Mall & Champa St",
                "departure_stop": "16th St Mall & Wewatta St",
                "name": "Free Mall Ride",
                "short_name": "MALLRIDE",
                "instructions": "Bus towards Free MallRide Civic Center",
                "distance": "0.6 mi",
                "duration": "6 mins",
                "color": "#5c6bc0",
                "num_stops": 9,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1493,
                "possible_route_id": 376,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to Champa St & 15th St",
                "distance": "0.1 mi",
                "duration": "2 mins",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            },
            {
                "id": 1494,
                "possible_route_id": 376,
                "headsign": "Wadsworth/Hampden PnR",
                "arrival_time": "6:22pm",
                "departure_time": "5:36pm",
                "arrival_stop": "W Yale Ave & S Wadsworth Way",
                "departure_stop": "Champa St & 15th St",
                "name": "South Federal Limited",
                "short_name": "30L",
                "instructions": "Bus towards Wadsworth/Hampden PnR",
                "distance": "11.1 mi",
                "duration": "47 mins",
                "color": "#0277bd",
                "num_stops": 38,
                "vehicle_type": "Bus",
                "credit_name": "Regional Transportation District",
                "credit_url": "http://rtd-denver.com/",
                "travel_mode": "TRANSIT"
            },
            {
                "id": 1495,
                "possible_route_id": 376,
                "headsign": null,
                "arrival_time": null,
                "departure_time": null,
                "arrival_stop": null,
                "departure_stop": null,
                "name": null,
                "short_name": null,
                "instructions": "Walk to S Wadsworth Blvd, Lakewood, CO, USA",
                "distance": "364 ft",
                "duration": "1 min",
                "color": null,
                "num_stops": null,
                "vehicle_type": null,
                "credit_name": null,
                "credit_url": null,
                "travel_mode": "Walking"
            }
        ]
    }
]
```
#### GET /api/v1/users/:uid/itineraries

Returns all itineraries that a user has searched in the same format as above.

#### POST /api/v1/users/:uid/itineraries/:itinerary_id

Creates a favorite itinerary that changes the favorite flag on an itinerary from false to true. Returns a JSON object of the last 4 possible routes created for that favorite itinerary.

#### GET /api/v1/users/:uid/favorites

Returns all of the user's favorite routes.

#### GET /api/v1/users/:uid/favorites/:itinerary_id

Returns the next 4 trips for the route identified by the favorite.

#### DELETE /api/v1/users/:uid/favorites/:itinerary_id

Changes the favorite flag on an itinerary from true to false.

