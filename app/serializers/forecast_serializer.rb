class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location,
              :summary,
              :details,
              :forecast
end
