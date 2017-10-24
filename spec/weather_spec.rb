# Test for multiple cit IDs method
require 'spec_helper'
require 'yaml'

describe 'weather' do

  before(:all) do
    service = WeatherService.new
    codes = YAML.load_file('city_codes_test.yml') #allows the sample data to be used in this file.
    @city = service.single_location('707860')
    @cities = service.multiple_locations(codes.sample(2)) # Taking the array of the sample data and choosing only two random inputs from that data.
  end
  context 'multiple city IDs' do

    it "should contain 2 hashes of data" do
     expect(@cities["list"].count).to equal(2)
    end

    it "longitude should be a float " do
       expect(@cities["list"][0]["coord"]["lon"]).to be_kind_of(Float)
    end

    it "latitude should be a float" do
      expect(@cities["list"][0]["coord"]["lat"]).to be_kind_of(Float)
    end

    it "temperature should be a float" do
      expect(@cities["list"][0]["main"]["temp"]).to be_kind_of(Float)
    end

    it "main weather should be a string" do
     expect(@cities["list"][0]["weather"][0]["main"]).to be_kind_of(String)
    end

  end

  context 'single city ID' do

    it "text" do
      # expect(@city["visibility"]).to be_kind_of(Numeric)
      p @city
    end

    it "text" do

    end

    it "text" do

    end

  end

end
