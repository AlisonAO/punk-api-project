require 'spec_helper'

describe 'weather' do

  before(:all) do
    service = WeatherService.new
    @city = service.single_location('')
    @cities = service.multiple_locations('')
  end

  it "text" do

  end

  it "text" do

  end

  it "text" do

  end

  it "text" do

  end






end
