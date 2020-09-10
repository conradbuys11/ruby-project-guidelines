require 'rest-client'
require 'json'
require 'pry'
require_relative 'runclass.rb'

def get_from_api(pages)
    #if argument is one, do this 1 times
    #if 3, do 3 times
    counter = 1
    response_array = []
    while counter <= pages do
        response_string = RestClient.get("https://icanhazdadjoke.com/search?page=#{counter}", :accept => 'application/json')
    # RestClient.get 'http://example.com/resource', :accept => 'image/jpg'
    # Accept: application/json
        # binding.pry
        response_array.push(JSON.parse(response_string))
        # binding.pry
        counter += 1
    end

    jokes_array = response_array.map{ |page| #for each page's results
        page["results"].map{ |result|        #for each result in results
            result["joke"]
        }
    }
    jokes_array.flatten
end