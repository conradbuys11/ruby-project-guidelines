class Joke < ActiveRecord::Base
    has_many :favorites
    has_many :users, through: :favorites
    belongs_to :category
    # has_many :joke_categories
    # has_many :categories, through: :joke_categories

    

end