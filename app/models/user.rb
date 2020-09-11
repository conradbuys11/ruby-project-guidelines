class User < ActiveRecord::Base
    has_many :favorites
    has_many :jokes, through: :favorites

    def add_favorite(joke)
        Favorite.find_or_create_by(user: self, joke: joke)
        #puts added to favorites > in CLI
    end

    def list_favorites
        if self.favorites == []
            puts "You have no favorite jokes yet!".blue.italic
            puts
        else
            self.favorites.each { |fave|
            if fave.joke.setup
                puts fave.joke.setup.yellow
            end
            puts fave.joke.punchline.yellow.italic
            puts
        }
        end
    end
end