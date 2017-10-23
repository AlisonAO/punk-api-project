require 'HTTParty'
require 'json'

class WeatherService
  include HTTParty

  base_uri

  def single_location(location)
    JSON.parse(self.class.get())
  end
end
