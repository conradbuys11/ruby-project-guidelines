User.delete_all
Joke.delete_all
Favorite.delete_all

User.find_or_create_by(
    name: "Conrad"
)

User.create(
    name: "Melinda"
)

Joke.create(
    title: "Chicken Coop Joke",
    setup: "Why does a chicken coop only have two doors?",
    punchline: "Because if it had four doors, it'd be a chicken sedan!",
    category: Category.find_or_create_by(name: "Dad Joke")
)

Joke.create(
    title: "Mermaid Joke",
    setup: "Why do mermaids wear seashells as bras?",
    punchline: "Because B-shells are too small!",
    category: Category.find_or_create_by(name: "NSFW")
)

Joke.create(
    title: "Shovel Joke",
    setup: nil,
    punchline: "The invention of the shovel was a groundbreaking discovery.",
    category: Category.find_or_create_by(name: "Pun")
)

Joke.create(
    title: "Duck Joke",
    setup: "What's a duck's favorite drug?",
    punchline: "Quack!",
    category: Category.find_or_create_by(name: "Pun")
)

Joke.create(
    title: "Ghost Joke",
    setup: "Why are ghosts banned from liquor stores?",
    punchline: "Because they steal all the boos!",
    category: Category.find_or_create_by(name: "Dad Joke")
)

Joke.create(
    title: "Glasses Joke",
    setup: "You should wear glasses when doing math.",
    punchline: "It improves di-vision!",
    category: Category.find_or_create_by(name: "Pun")
)

Joke.create(
    title: "Holy Water Joke",
    setup: "How do you make holy water?",
    punchline: "You boil the hell out of it!",
    category: Category.find_or_create_by(name: "Dad Joke")
)

Joke.create(
    title: "Jay-Z Joke",
    setup: "What does Jay-Z call Beyonce after proposing?",
    punchline: "Fiyonce Knowles!",
    category: Category.find_or_create_by(name: "Pun")
)

Joke.create(
    title: "Napoleon anti-joke",
    setup: "Where does Napoleon keep his armies?",
    punchline: "In his sleevies.",
    category: Category.find_or_create_by(name: "Anti joke")
)

Joke.create(
    title: "Stick anti joke",
    setup: "What's brown and sticky?",
    punchline: "A stick.",
    category: Category.find_or_create_by(name: "Anti joke")
)

Joke.create(
    title: "Paint anti joke",
    setup: "What's red and smells like blue paint?",
    punchline: "Red paint.",
    category: Category.find_or_create_by(name: "Anti joke")
)