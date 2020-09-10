class Run

        attr_accessor :user, :joke 

        def self.start
            new_run = Run.new
            new_run.get_user
        end

        def get_user
            puts "What's your name?"
            input = gets.chomp.split.map(&:capitalize).join(' ')
            self.user = User.find_or_create_by(name: input)
                #based on whether the user is new, say "welcome" vs "welcome back"
                #make sure to .capitalize the gets.chomp
            puts "Welcome to the PUNDERDOME, #{self.user.name}!"
            main_menu
        end

        #reference: https://learn.co/lessons/cli-applications-jukebox
        def main_menu
            puts "Choose from the options below:"
            puts "- f : see your favorite jokes"
            puts "- r : get a random joke"
            puts "- l : see a list of categories"
            puts "- x : exit the PUNDERDOME!"

            input = gets.chomp
            
            case input       
                when "f" 
                   puts
                    display_favorites
                when "r"
                    get_joke 
                when "l"
                    joke_categories
                when "x"
                    exit_punderdome
                end
        end

        def get_joke
            self.joke = Joke.all.sample
            puts "******************"
            if self.joke.setup
                puts self.joke.setup
            end
            puts self.joke.punchline
            puts "******************"
            set_favorite
        end

        def set_favorite
            puts "Did you like this joke? Y/n"
            input = gets.chomp
            if input != "n"
                self.user.add_favorite(self.joke)
                puts "Added to your favorites!"
                puts "*****************"
            end
            self.user = User.find(self.user.id)
            main_menu
        end

        def display_favorites
            #if no favorites, say "hey bud wut u doin go look at jokes fool"
            self.user.list_favorites
            main_menu
        end

        def joke_categories
            puts "Type in a category below:"
            puts
            Category.all.each{ |category|
                puts category.name
            }
            puts
            category_joke = Category.find_by(name: gets.chomp.downcase).list_jokes.sample
            puts
            if category_joke.setup
                puts category_joke.setup
            end
            puts category_joke.punchline
            puts
            set_favorite
        end

        def exit_punderdome
            puts "Okay, well...bye, I guess..."
        end
end