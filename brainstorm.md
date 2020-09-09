-------------------------------------
class Joke
	-Name
	-Joke contents (setup, punchline)
	-Type (array, can be multiple types)
	-Rating (array?)
	-Was it created by a user?/User that created it
end
--
class User
	-Name
	-Favorite/saved jokes
	-Created jokes
end
--
class JokeUser
	-Single Source of Truth (joke & user)
	-Stores a rating
end
--
class Category/Type
	-Name
	-Description? [stretch]
end
--
class JokeCategory
	-Single Source of Truth (joke & category)
end
-------------------------------------
As a user, I want to store my jokes so that I have a place to remember them when I need to impress people with my humor.
As a user, I want to add my own jokes so that I can impress people with my humor.
As a user, I want to search for types of jokes so that I can fit my humor to the crowd I'm with.
As a user, I want to be able to rate jokes so that people don't have to bother with crappy humor.
As a user, I want to be able to see which jokes I reviewed.