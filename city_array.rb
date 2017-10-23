require 'json'

json = JSON.parse(File.read('city_list.json'))
#
# json[0]['id'].class
#
#
# json.each do |i|
#    i['id']
# end


json.each do |i|
  File.write('city_code.yml', "- #{i['id']}")
  # File.open('city_code.yml','w') do |h|
  #    h.write ("- #{i['id']}").to_yaml
  #  end
end
