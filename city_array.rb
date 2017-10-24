# This file would have been used to iterate through the ID data array and then write it to a YAML file. As there were over 210,000
# IDs, I used a sample data instead of the raw data.
require 'json'

json = JSON.parse(File.read('city_list.json'))

json.each do |i|
  File.write('city_code.yml', "- #{i['id']}")
end
