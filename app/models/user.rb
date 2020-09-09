class User < ActiveRecord::Base
    has_many :favorites
    has_many :jokes, through: :favorites

    def add_favorite(joke)
        Favorite.create(user: self, joke: joke)
        #puts added to favorites > in CLI
    end

    def list_favorites
        self.favorites.each { |fave|
        if fave.joke.setup
            puts fave.joke.setup
        end
        puts fave.joke.punchline
        puts
        }
    end
    
end