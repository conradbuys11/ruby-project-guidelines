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
            choices = prompt.select("Choose from the options below:".italic.light_cyan) do |menu| 
            menu.choice "- see your favorite jokes"
            menu.choice "- get a random joke"
            menu.choice "- get a joke by category"
            menu.choice "- exit the "+"PUNDERDOME!".bold.green
           end  
            
           if choices == "- see your favorite jokes"
                display_favorites
           elsif choices == "- get a random joke"
                get_joke 
           elsif choices == "- get a joke by category"
                joke_categories
           else
                exit_punderdome
           end
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

            prompt = TTY::Prompt.new
            choices = prompt.select("Did you like this joke? Y/N".light_magenta) do |menu|
                menu.choice "Yes"
                menu.choice "No"
            end

            if choices == "Yes"
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
            prompt = TTY::Prompt.new
            choices = prompt.select("Choose a category below:".italic.green) do |menu|
            
            Category.all.each{ |category|
                menu.choice category.name
            }
            end

            puts
            category_joke = Category.find_by(name: choices.downcase).list_jokes.sample
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
            puts
            puts "Okay, well...bye, I guess...".light_red.italic
            puts
        end
end