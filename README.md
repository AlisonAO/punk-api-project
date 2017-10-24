# Weather API Tests Project

A ruby project for test automation of the OpenWeatherMap [OpenWeatherMap](https://openweathermap.org/) API for the current weather data. 

This service creates a class for the OpenWeatherMap API and runs tests that correspond to the data.

These are API integration tests, and test a range of the data, from the location temperarture to the location latitude and longitude.

Created for an in-class project in the Sparta Global SDET class.  


## Key Information
The data tested in this project uses city IDs. There are over 210,000 IDs. For the purposes of speed and API calling restrictions, I have created a sample YAML file of the data to use for this project. 

The API calls are restricted to calling up to a maximum of 20 IDs at one time. This project only calls a maximum of 3 random IDs at one time.

In order to use the OpenWeatherMap API you will need an API key. In order to recieve one, you will have to sign up for an account [here](https://home.openweathermap.org/users/sign_up). Place this key in a `yml` file and replace the filename in the `weather_object.rb` file, 
`token = YAML.load_file('FILENAME')`

 This key is appened to the end of the URL request.


## Getting Started
These instructions will get you a copy of the tests up and running on your local machine.

### Prerequisites
You will need the following gems:

* RSpec
* JSON
* HTTParty

As stated above, you need a key in order to use the OpenWeatherMap API. 

### Installing
To install the project:

Click on the green 'clone or download' button in the top right hand corner.

Extract the folder from your downloads folder.

Open the file in a text editor.

Open folder in terminal.

## Usage


The tests in this project test the general information from the api and if all the fields are aligned correctly with the documentaion.

The class in this project tests multiple city IDs and a single city ID.

To change the single city tested, edit the City ID in the weather_spec.rb file to an ID of your choice.
  `@city = service.single_location('City ID')`
  
--  

To run the tests: 

1. Type `rspec` in your terminal. You should see a list of the tests and if they pass (they will turn green).



## Technologies Used
* HTTParty - 0.15.6
* JSON - 2.1.0
* RSpec - 3.6
* Ruby - 2.4.1
* YAML - 1.2