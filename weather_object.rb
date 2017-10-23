require 'HTTParty'
require 'json'
require 'yaml'

class WeatherService
  include HTTParty
  base_uri 'https://api.openweathermap.org/data/2.5/weather'
  # attr_accessor :token
  #
  #   @token = YAML.load_file('token.yml')
  # end
  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  def single_location(location)
    JSON.parse(self.class.get("?q={location}" + "#{@token}").body)
  end

  # def multiple_locations(location_array)
  #   JSON.parse(self.class.post("/postcodes", body: {"postcodes": postcodes_array}).body)
  # end

end

city = WeatherService.new
puts city.single_location('london')
