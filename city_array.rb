require 'json'

array = []

json = JSON.parse(File.read('city_list.json'))

p json[0]['id'].class


json.each do |i|
  p i['id']
end
