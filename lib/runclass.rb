class Run

        attr_accessor :user, :joke 

        def self.start
            new_run = Run.new
            new_run.get_user
        end

        def get_user
            puts
            puts "What's your name?".magenta.bold
            input = gets.chomp.split.map(&:capitalize).join(' ')
            self.user = User.find_or_create_by(name: input)
                #based on whether the user is new, say "welcome" vs "welcome back"
                #make sure to .capitalize the gets.chomp
            puts
            puts "Welcome to the PUNDERDOME, #{self.user.name}!".cyan.bold
            main_menu
        end

        #reference: https://learn.co/lessons/cli-applications-jukebox
        def main_menu
            prompt = TTY::Prompt.new
            choices = prompt.select("Choose from the options below:") do |menu| #italic.light_cyan
            menu.choice "- f : see your favorite jokes"
            menu.choice "- r : get a random joke"
            menu.choice "- l : see a list of categories"
            menu.choice "- x : exit the "+"PUNDERDOME!".bold.green
           end  
            
           if choices == "- f : see your favorite jokes"
                display_favorites
           elsif choices == "- r : get a random joke"
                get_joke 
           elsif choices == "- l : see a list of categories"
                joke_categories
           else
                exit_punderdome
           end


            # input = gets.chomp
             
            # case input      
            #     when "f" 
            #        puts
            #         display_favorites
            #     when "r"
            #         get_joke 
            #     when "l"
            #         joke_categories
            #     when "x"
            #         exit_punderdome
            #     end
        end

        def get_joke
            self.joke = Joke.all.sample
            puts 
            if self.joke.setup
                puts self.joke.setup.light_yellow.italic
            end
            puts self.joke.punchline.light_yellow.italic
            puts 
            set_favorite
        end

        def set_favorite
            puts "Did you like this joke? Y/N".light_magenta
            input = gets.chomp
            if !!input.match(/[^N]/i)
                self.user.add_favorite(self.joke)
                puts "Added to your favorites!".italic.light_magenta
                puts 
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
            puts "Type in a category below:".italic.green
            puts
            Category.all.each{ |category|
                puts category.name
            }
            puts
            category_joke = Category.find_by(name: gets.chomp.downcase).list_jokes.sample
            puts
            if category_joke.setup
                puts category_joke.setup.light_yellow
            end
            puts category_joke.punchline.light_yellow.italic
            puts
            self.joke = category_joke
            set_favorite
        end

        def exit_punderdome
            puts "Okay, well...bye, I guess...".light_red.italic
        end
end