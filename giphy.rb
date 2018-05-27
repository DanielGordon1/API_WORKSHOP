require 'net/http'
require 'json'

url = "http://api.giphy.com/v1/gifs/search?q=le+wagon&api_key=3aBU3SJCOtxDFuN0pwWKF2MHjsKIs9U0
&limit=5"
resp = Net::HTTP.get_response(URI.parse(url))
content = resp.body
result = JSON.parse(content)
giphys = result["data"]
giphys.first.each do |giphy|
  puts giphy
end
