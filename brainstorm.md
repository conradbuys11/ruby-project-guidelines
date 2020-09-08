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