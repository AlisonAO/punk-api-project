require 'HTTParty'
require 'json'
require 'yaml'

class WeatherService
  include HTTParty

  base_uri 'https://api.openweathermap.org/data/2.5'
# <--- In order to
  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end
# <--- This will search through the data
  def single_location(location)
    JSON.parse(self.class.get("/weather?id=#{location}" + "#{@token}").body)
  end

  def multiple_locations(location_array)
    JSON.parse(self.class.get("/group?id=" + "#{location_array.map{ |id| id }.join(',')}" + "&units=metric" + "#{@token}").body) #why no hash with the units=metric code?
  end

end
