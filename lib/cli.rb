# def welcome
#     puts "Welcome to the PUNDERDOME!"

#     #puts Would you like to favorite this joke? Y/N
#     #Favorite.create(user,joke)
# end

#stretch goal: delete user (very sad D:)

def get_user
    puts "What's your name?"
    input = gets.chomp.capitalize
    this_user = User.find_or_create_by(name: input)
        #based on whether the user is new, say "welcome" vs "welcome back"
        #make sure to .capitalize the gets.chomp
    puts "Welcome to the PUNDERDOME, #{this_user.name}!"
    this_user
end

def get_joke(user)
    puts "Would you like to hear a joke? Y/n"
    #commands for future/stretch:
    #help
        #add user to db
        #categories
        #reference: https://learn.co/lessons/cli-applications-jukebox


    if gets.chomp != "n"
        #stretch goal - use regex [nN]
        joke = Joke.all.sample
        if joke.setup
            puts joke.setup
        end
        puts joke.punchline
    else
        puts "Well... okay, I guess? Why are you even here, then?"
    end
end

