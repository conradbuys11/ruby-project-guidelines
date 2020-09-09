class User < ActiveRecord::Base
    has_many :favorites
    has_many :jokes, through: :favorites

    def add_favorite(joke)
        Favorite.create(user: self, joke: joke)
        #puts added to favorites > in CLI
    end
end