# Sweater Weater

This application provides weather information for a roadtrip. Currently, this is a Rails API with endpoints created per [project specifications for Turing School](https://backend.turing.io/module3/projects/sweater_weather/requirements).

Deployed on heroku at `https://sweater-weather-ap.herokuapp.com/`

## Focus Areas

* Consuming a number of various APIs
* Producing serialized API responses
* Authenticated API calls
* Test driven development


## APIs Used
* [Google Geocode API](https://developers.google.com/maps/documentation/geocoding/intro)
* [DarkSky API](https://darksky.net/dev)
* [Google Directions API](https://developers.google.com/maps/documentation/directions/start)
* [Unsplash API](https://unsplash.com/documentation)

# Technical Specifications

* Ruby version 2.4.1
* Rails API version 5.2.4.1

#### Local Environment:
  ```
  git clone
  bundle install
  bundle exec rake db:{create,migrate}
  rails s
  ```

### Running Tests:
  - You can run the full testing suite with the command `bundle exec rspec`

  - You can run an individual test using `bundle exec rspec <path-to-file>`
  
### Using Fiagro in development and testing:
Keep environment variables secure by using Figaro to generate an `application.yml` file. See more information about using the figaro gem at https://github.com/laserlemon/figaro.

### Required Environment Variables
Environment variables and required API keys/tokens (in Figaro format) :
1. Google Geocode API Key defined as `ENV['GOOGLE_GEO_API_KEY']`
2. Darksky Developer Token defined as `ENV['DARKSKY_API_KEY']`
3. Unsplash API Key defined as `ENV['UNSPLASH_API_KEY']`
1. Google Directions API Key defined as `ENV['GOOGLE_API_KEY']`

### Refreshing VCR Test Cassettes
From time to time you may receive an error when testing with the VCR. You can delete the cassettes directory from your `spec` folder and run `bundle exec rspec` to refresh the cassettes used. More information on VCR cassettes can be found in the [VCR documentation](https://github.com/vcr/vcr).
