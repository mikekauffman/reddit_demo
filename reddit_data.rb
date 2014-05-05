require 'faraday'
require 'json'

response = Faraday.get "http://www.reddit.com/r/aww/.json"
json_data = response.body
image_data = JSON.parse(json_data)["data"]["children"].select { |data|
data["data"]["url"].include?("http://i.imgur.com")
}

urls = image_data.map { |data| data["data"]["url"] }

p urls