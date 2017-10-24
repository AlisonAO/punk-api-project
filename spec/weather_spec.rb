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
# <--- Tests for multiple cities ID --->
  context 'multiple city IDs' do

    it "should contain 2 hashes of data" do
     expect(@cities["list"].count).to equal(2)
    end

    it "longitude should be a float " do
       expect(@cities["list"][0]["coord"]["lon"]).to be_kind_of(Float)
    end

    it "longitude should be between -180 to 180" do
      expect(@cities["list"][0]["coord"]["lon"]).to be_between(-180, 180).inclusive
    end

    it "latitude should be a float" do
      expect(@cities["list"][0]["coord"]["lat"]).to be_kind_of(Float)
    end

    it "latitude should be between -180 to 180" do
      expect(@cities["list"][0]["coord"]["lat"]).to be_between(-180, 180).inclusive
    end

    it "temperature should be a float" do
      expect(@cities["list"][0]["main"]["temp"]).to be_kind_of(Float)
    end

    it "main weather should be a string" do
     expect(@cities["list"][0]["weather"][0]["main"]).to be_kind_of(String)
    end

  end

# <--- Tests for the single city ID --->
  context 'single city ID' do

    it "should return only one set of data" do
     expect(@city["weather"].count).to eq(1)
    end

    it "country code should be a string" do
      expect(@city["sys"]["country"]).to be_kind_of(String)
    end

    it "country code length should be 2 characters" do
        expect(@city["sys"]["country"].length).to equal(2)
    end

    it "weather should be a hash" do
      expect(@city["weather"]).to be_kind_of(Array)
    end

    it "weather should be a hash" do
      expect(@city["weather"]).to be_kind_of(Array)
    end

  end

end
