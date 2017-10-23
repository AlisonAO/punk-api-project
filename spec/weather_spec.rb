require 'spec_helper'
require 'yaml'

describe 'weather' do

  before(:all) do
    service = WeatherService.new
    codes = YAML.load_file('city_codes_test.yml')
    # @city = service.single_location('')
    @cities = service.multiple_locations(codes.sample(1))
  end

  it "text" do
    p @cities

  end

  it "text" do

  end

  it "text" do

  end

  it "text" do

  end






end
