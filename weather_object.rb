require 'HTTParty'
require 'json'
require 'yaml'

class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5'
  # attr_accessor :token

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  def single_location(location)
    JSON.parse(self.class.get("/weather?id={location}" + "#{@token}").body)
  end

  def multiple_locations(location_array)
    JSON.parse(self.class.get("/group?id=", body: {"location": location_array} + "#{@token}").body)
  end

end

# city = WeatherService.new
# puts city.single_location('london')

cities = WeatherService.new
puts cities.multiple_locations(['819827', '524901'])
