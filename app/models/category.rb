class Category < ActiveRecord::Base
    has_many :jokes

    def list_jokes
        Joke.all.select{ |joke|
            joke.category == self
        }
    end
end