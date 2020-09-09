class Run

        attr_accessor :user, :joke 

        def self.start
            new_run = Run.new
            new_run.get_user
        end

        def get_user
            puts "What's your name?"
            input = gets.chomp.capitalize
            self.user = User.find_or_create_by(name: input)
                #based on whether the user is new, say "welcome" vs "welcome back"
                #make sure to .capitalize the gets.chomp
            puts "Welcome to the PUNDERDOME, #{self.user.name}!"
            main_menu
        end

        def main_menu
            puts "Choose from the options below:"
            puts "- f :  see your favorite jokes"
            puts "- j : get a random joke"
            puts "- l : see a list of categories"
            puts "- x : exit the PUNDERDOME!"

            input = gets.chomp
            
            case input       
                when "f" 
                    puts
                    display_favorites
                when "j"
                    get_joke 
                when "l"
                    #list_categories method
                when "x"
                    exit_punderdome
                end
        end

        def get_joke

            #reference: https://learn.co/lessons/cli-applications-jukebox
                #stretch goal - use regex [nN]

                self.joke = Joke.all.sample
                puts "******************"
                if self.joke.setup
                    puts self.joke.setup
                end
                puts self.joke.punchline
                puts "******************"

                #add to favorites 

                puts "Did you like this joke? Y/n"
                input = gets.chomp
                if input != "n"
                    self.user.add_favorite(self.joke)
                    puts "Added to your favorites!"
                    puts "*****************"
                end
                main_menu
        end

        def display_favorites
            self.user.favorites.each {|fave|
            
            if fave.joke.setup 
                puts fave.joke.setup 
            end
            puts fave.joke.punchline
            puts
        }

            main_menu
        end

        def exit_punderdome
            puts "Okay, well...bye, I guess..."
        end
end