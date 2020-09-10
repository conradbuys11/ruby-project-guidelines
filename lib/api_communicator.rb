require 'rest-client'
require 'json'
require 'pry'
require_relative 'runclass.rb'

def get_from_api
    response_string = RestClient.get('https://icanhazdadjoke.com/search', :accept => 'application/json')
    # RestClient.get 'http://example.com/resource', :accept => 'image/jpg'
    # Accept: application/json
    response_hash = JSON.parse(response_string)

    jokes_array = response_hash["results"].map{ |result|
        result["joke"]
    }
    return jokes_array
end


