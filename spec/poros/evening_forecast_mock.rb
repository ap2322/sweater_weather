class EveningForecastMock
  def self.forecast
    {:latitude=>39.7392358,
 :longitude=>-104.990251,
 :timezone=>"America/Denver",
 :currently=>
  {:time=>1579150800,
   :summary=>"Clear",
   :icon=>"clear-night",
   :precipIntensity=>0.001,
   :precipProbability=>0.01,
   :precipType=>"snow",
   :precipAccumulation=>0.011,
   :temperature=>29.54,
   :apparentTemperature=>24.81,
   :dewPoint=>11.22,
   :humidity=>0.46,
   :pressure=>1029.9,
   :windSpeed=>4.38,
   :windGust=>6.03,
   :windBearing=>177,
   :cloudCover=>0.13,
   :uvIndex=>0,
   :visibility=>10,
   :ozone=>313.5},
 :hourly=>
  {:summary=>"Clear throughout the day.",
   :icon=>"clear-day",
   :data=>
    [{:time=>1579071600,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>34.43,
      :apparentTemperature=>28.62,
      :dewPoint=>10.91,
      :humidity=>0.37,
      :pressure=>1013.9,
      :windSpeed=>6.7,
      :windGust=>12.34,
      :windBearing=>65,
      :cloudCover=>0.01,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>349.8},
     {:time=>1579075200,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>30.24,
      :apparentTemperature=>26.56,
      :dewPoint=>14.54,
      :humidity=>0.52,
      :pressure=>1014.6,
      :windSpeed=>3.57,
      :windGust=>8.37,
      :windBearing=>72,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>347},
     {:time=>1579078800,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>28.03,
      :apparentTemperature=>28.03,
      :dewPoint=>17.77,
      :humidity=>0.65,
      :pressure=>1016.5,
      :windSpeed=>1.34,
      :windGust=>3.86,
      :windBearing=>141,
      :cloudCover=>0.01,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>344.6},
     {:time=>1579082400,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>26.72,
      :apparentTemperature=>26.72,
      :dewPoint=>17.61,
      :humidity=>0.68,
      :pressure=>1017.6,
      :windSpeed=>2.22,
      :windGust=>4.56,
      :windBearing=>179,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>342.8},
     {:time=>1579086000,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>26.05,
      :apparentTemperature=>26.05,
      :dewPoint=>17.25,
      :humidity=>0.69,
      :pressure=>1018.9,
      :windSpeed=>1.92,
      :windGust=>4.31,
      :windBearing=>174,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>341.4},
     {:time=>1579089600,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>25.23,
      :apparentTemperature=>25.23,
      :dewPoint=>16.83,
      :humidity=>0.7,
      :pressure=>1020,
      :windSpeed=>1.61,
      :windGust=>3.88,
      :windBearing=>142,
      :cloudCover=>0.01,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>340.5},
     {:time=>1579093200,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>24.49,
      :apparentTemperature=>24.49,
      :dewPoint=>15.98,
      :humidity=>0.7,
      :pressure=>1020.2,
      :windSpeed=>2.67,
      :windGust=>5.3,
      :windBearing=>131,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>339.9},
     {:time=>1579096800,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>24.63,
      :apparentTemperature=>19.9,
      :dewPoint=>15.56,
      :humidity=>0.68,
      :pressure=>1022,
      :windSpeed=>3.73,
      :windGust=>6.33,
      :windBearing=>171,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>339.4},
     {:time=>1579100400,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>24.87,
      :apparentTemperature=>21.03,
      :dewPoint=>15.72,
      :humidity=>0.68,
      :pressure=>1023,
      :windSpeed=>3.14,
      :windGust=>5.44,
      :windBearing=>233,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>339},
     {:time=>1579104000,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>29.99,
      :apparentTemperature=>29.99,
      :dewPoint=>14.95,
      :humidity=>0.53,
      :pressure=>1022.8,
      :windSpeed=>2.38,
      :windGust=>5.52,
      :windBearing=>140,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>339.3},
     {:time=>1579107600,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>36.34,
      :apparentTemperature=>36.34,
      :dewPoint=>14.38,
      :humidity=>0.4,
      :pressure=>1021.8,
      :windSpeed=>2.06,
      :windGust=>6.11,
      :windBearing=>94,
      :cloudCover=>0,
      :uvIndex=>1,
      :visibility=>10,
      :ozone=>339.8},
     {:time=>1579111200,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>41.49,
      :apparentTemperature=>38.04,
      :dewPoint=>13.92,
      :humidity=>0.32,
      :pressure=>1020.5,
      :windSpeed=>5.26,
      :windGust=>9.5,
      :windBearing=>53,
      :cloudCover=>0,
      :uvIndex=>2,
      :visibility=>10,
      :ozone=>339.4},
     {:time=>1579114800,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>45.24,
      :apparentTemperature=>41.32,
      :dewPoint=>12.63,
      :humidity=>0.26,
      :pressure=>1019.3,
      :windSpeed=>7.25,
      :windGust=>10.87,
      :windBearing=>12,
      :cloudCover=>0,
      :uvIndex=>2,
      :visibility=>10,
      :ozone=>337.5},
     {:time=>1579118400,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>47.75,
      :apparentTemperature=>43.4,
      :dewPoint=>13.2,
      :humidity=>0.25,
      :pressure=>1018.6,
      :windSpeed=>9.56,
      :windGust=>13.46,
      :windBearing=>7,
      :cloudCover=>0,
      :uvIndex=>2,
      :visibility=>10,
      :ozone=>334.6},
     {:time=>1579122000,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>48.51,
      :apparentTemperature=>43.87,
      :dewPoint=>13.76,
      :humidity=>0.24,
      :pressure=>1018.8,
      :windSpeed=>10.94,
      :windGust=>16.67,
      :windBearing=>357,
      :cloudCover=>0.03,
      :uvIndex=>1,
      :visibility=>10,
      :ozone=>331.5},
     {:time=>1579125600,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>48.44,
      :apparentTemperature=>44.18,
      :dewPoint=>12.32,
      :humidity=>0.23,
      :pressure=>1020.2,
      :windSpeed=>9.79,
      :windGust=>15.26,
      :windBearing=>357,
      :cloudCover=>0.05,
      :uvIndex=>1,
      :visibility=>10,
      :ozone=>328},
     {:time=>1579129200,
      :summary=>"Clear",
      :icon=>"clear-day",
      :precipIntensity=>0.0014,
      :precipProbability=>0.01,
      :precipType=>"rain",
      :temperature=>46.72,
      :apparentTemperature=>42.65,
      :dewPoint=>4.42,
      :humidity=>0.17,
      :pressure=>1021.7,
      :windSpeed=>8.29,
      :windGust=>13.09,
      :windBearing=>355,
      :cloudCover=>0.02,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>324.1},
     {:time=>1579132800,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>42.29,
      :apparentTemperature=>38.04,
      :dewPoint=>8.63,
      :humidity=>0.25,
      :pressure=>1023.7,
      :windSpeed=>6.75,
      :windGust=>13.39,
      :windBearing=>341,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>321.1},
     {:time=>1579136400,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0.0017,
      :precipProbability=>0.01,
      :precipType=>"rain",
      :temperature=>38.15,
      :apparentTemperature=>33.8,
      :dewPoint=>10.63,
      :humidity=>0.32,
      :pressure=>1025.8,
      :windSpeed=>5.65,
      :windGust=>14.03,
      :windBearing=>318,
      :cloudCover=>0,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>319.8},
     {:time=>1579140000,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>35.23,
      :apparentTemperature=>30.58,
      :dewPoint=>11.73,
      :humidity=>0.37,
      :pressure=>1027.1,
      :windSpeed=>5.35,
      :windGust=>13.23,
      :windBearing=>253,
      :cloudCover=>0.02,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>319.4},
     {:time=>1579143600,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0,
      :precipProbability=>0,
      :temperature=>33.06,
      :apparentTemperature=>28.2,
      :dewPoint=>11.6,
      :humidity=>0.4,
      :pressure=>1028.1,
      :windSpeed=>5.13,
      :windGust=>10.44,
      :windBearing=>272,
      :cloudCover=>0.03,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>318.4},
     {:time=>1579147200,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0.001,
      :precipProbability=>0.01,
      :precipType=>"snow",
      :precipAccumulation=>0.0077,
      :temperature=>31.56,
      :apparentTemperature=>26.54,
      :dewPoint=>11.6,
      :humidity=>0.43,
      :pressure=>1029.4,
      :windSpeed=>5.01,
      :windGust=>7.85,
      :windBearing=>232,
      :cloudCover=>0.1,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>316.2},
     {:time=>1579150800,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0.001,
      :precipProbability=>0.01,
      :precipType=>"snow",
      :precipAccumulation=>0.0089,
      :temperature=>29.54,
      :apparentTemperature=>24.81,
      :dewPoint=>11.22,
      :humidity=>0.46,
      :pressure=>1029.9,
      :windSpeed=>4.38,
      :windGust=>6.03,
      :windBearing=>177,
      :cloudCover=>0.13,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>313.5},
     {:time=>1579154400,
      :summary=>"Clear",
      :icon=>"clear-night",
      :precipIntensity=>0.0002,
      :precipProbability=>0.01,
      :precipType=>"snow",
      :precipAccumulation=>0.0023,
      :temperature=>27.75,
      :apparentTemperature=>22.94,
      :dewPoint=>10.61,
      :humidity=>0.48,
      :pressure=>1030,
      :windSpeed=>4.2,
      :windGust=>5.46,
      :windBearing=>173,
      :cloudCover=>0.21,
      :uvIndex=>0,
      :visibility=>10,
      :ozone=>311.8}]},
 :daily=>
  {:data=>
    [{:time=>1579071600,
      :summary=>"Clear throughout the day.",
      :icon=>"clear-day",
      :sunriseTime=>1579098000,
      :sunsetTime=>1579132800,
      :moonPhase=>0.7,
      :precipIntensity=>0.0003,
      :precipIntensityMax=>0.0017,
      :precipIntensityMaxError=>0.0452,
      :precipIntensityMaxTime=>1579136340,
      :precipProbability=>0.02,
      :precipType=>"snow",
      :precipAccumulation=>0.03,
      :temperatureHigh=>49.13,
      :temperatureHighError=>12.64,
      :temperatureHighTime=>1579123920,
      :temperatureLow=>22.53,
      :temperatureLowError=>12.63,
      :temperatureLowTime=>1579185180,
      :apparentTemperatureHigh=>44.24,
      :apparentTemperatureHighTime=>1579124880,
      :apparentTemperatureLow=>16.16,
      :apparentTemperatureLowTime=>1579183080,
      :dewPoint=>13.37,
      :humidity=>0.45,
      :pressure=>1021.9,
      :windSpeed=>4.93,
      :windGust=>16.72,
      :windGustTime=>1579122420,
      :windBearing=>354,
      :cloudCover=>0.02,
      :uvIndex=>2,
      :uvIndexTime=>1579115400,
      :visibility=>10,
      :ozone=>332.5,
      :temperatureMin=>23.93,
      :temperatureMinError=>12.64,
      :temperatureMinTime=>1579098960,
      :temperatureMax=>49.13,
      :temperatureMaxError=>12.65,
      :temperatureMaxTime=>1579123920,
      :apparentTemperatureMin=>19.56,
      :apparentTemperatureMinTime=>1579098120,
      :apparentTemperatureMax=>44.24,
      :apparentTemperatureMaxTime=>1579124880}]},
 :flags=>
  {:sources=>["cmc", "gfs", "hrrr", "icon", "isd", "madis", "nam", "sref"],
   :"nearest-station"=>1.334,
   :units=>"us"},
 :offset=>-7}
  end
end
