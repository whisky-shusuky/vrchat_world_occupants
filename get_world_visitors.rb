require 'net/http'
require 'uri'
require 'json'
require 'yaml'

world_endpoint = 'https://vrchat.net/api/1/worlds/'
vrc_public_api_key = 'JlE5Jldo5Jibnk5O5hTx6XVqsJu4WJ26'
parsed_worlds = YAML.load_file('config/target_world.yml') 

def get_json(location, limit = 10)
  raise ArgumentError, 'too many HTTP redirects' if limit == 0
  uri = URI.parse(location)
  begin
    response = Net::HTTP.start(uri.host, uri.port, use_ssl: uri.scheme == 'https') do |http|
      http.open_timeout = 5
      http.read_timeout = 10
      http.get(uri.request_uri)
    end
    case response
    when Net::HTTPSuccess
      json = response.body
      JSON.parse(json)
    when Net::HTTPRedirection
      location = response['location']
      warn "redirected to #{location}"
      get_json(location, limit - 1)
    else
      puts [uri.to_s, response.value].join(" : ")
      # handle error
    end
  rescue => e
    puts [uri.to_s, e.class, e].join(" : ")
    # handle error
  end
end

for world_id in parsed_worlds
  puts get_json("#{world_endpoint}#{world_id}?apiKey=#{vrc_public_api_key}")
end
  
  