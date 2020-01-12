require 'rails_helper'

describe "Forecast API" do
  it "sends a list of items" do

    get '/api/v1/forecast?location=denver,co'
    # Needs to pull out the city and state from the GET request
    # and send it to Google’s Geocoding API to retrieve the lat and long for the city (this can be its own story).
    # Use of the Google Geocoding API is a hard requirement.


    # Retrieve forecast data from the Darksky API using the lat and long

    # response is based on wireframe
    expect(response).to be_successful
  end
end


# Example Output:
# {
#   summary: {
#     location: 'Denver, CO',
#     country: 'United State',
#     time: '11:11 PM',
#     date: '10/31',
#     temperature: 38,
#     high: 80,
#     low: -15,
#     icon: 'partly cloudy',
#   },
#
#   details: {
#     icon: 'partly cloudy',
#     today_details: 'Mostly cloudy until afternoon',
#     tonight_details: 'Partly cloudy starting tonight, continuing until tomorrow morning',
#     feels_like: 30,
#     humidity: 0.75,
#     visibility_miles: 10.00,
#     uv_index: 2,
#     uv_index_relative: '(low)',
#   },
#
#   five_day_forecast: {
#      hourly: [
#        {time: '11 PM', temperature: 38},
#        {time: '12 AM', temperature: 38},
#        {time: '1 AM', temperature: 38},
#        {time: '2 AM', temperature: 38},
#        {time: '3 AM', temperature: 38},
#        {time: '4 AM', temperature: 38},
#        {time: '5 AM', temperature: 38},
#        {time: '6 AM', temperature: 38},
#        {time: '7 AM', temperature: 38},
#      ],
#      daily: [
#        {day: 'Wednesday', cloud_cover: 'Sunny', precipitation: 0.90, temp_high: 55, temp_low: 45 },
#        {day: 'Thursday', cloud_cover: 'Sunny', precipitation: 0.90, temp_high: 55, temp_low: 45 },
#        {day: 'Friday', cloud_cover: 'Sunny', precipitation: 0.90, temp_high: 55, temp_low: 45 },
#        {day: 'Saturday', cloud_cover: 'Sunny', precipitation: 0.90, temp_high: 55, temp_low: 45 },
#        {day: 'Sunday', cloud_cover: 'Sunny', precipitation: 0.90, temp_high: 55, temp_low: 45 },
#      ]
#   }
# }
