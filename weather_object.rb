require 'HTTParty'
require 'json'
require 'yaml'

class WeatherService
  include HTTParty

  base_uri 'https://api.openweathermap.org/data/2.5'

  def initialize
    token = YAML.load_file('token.yml')
    @token = token['token']
  end

  def single_location(location)
    JSON.parse(self.class.get("/weather?id=#{location}" + "#{@token}").body)
  end

  def multiple_locations(location_array)
    JSON.parse(self.class.get("/group?id=" + "#{location_array.map{ |id| id }.join(',')}" + "&units=metric" + "#{@token}").body) #why no hash with the units=metric code?
  end

end


# puts codes

# city = WeatherService.new
# puts city.single_location("707860")

# cities = WeatherService.new
# p cities.multiple_locations(codes.sample(1))

# array = [2, 5, 1]
# puts "The numbers you entered in the array were: #{array.map{|num| num }.join(',')}"


# "#{location_array.map{|code| code }.join(',')}"
# array = ['707860', '519188']
# puts "The numbers you entered in the array were: #{array.map{|num| num }.join(',')}"


# def tests(location_array)
#   "/group?id=" + "#{location_array.map{|id| id }.join(',')}" + "&units=metric" + "#{@token}"
# end
# puts tests(["707860", "519188"])
