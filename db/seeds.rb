User.delete_all
Joke.delete_all

User.find_or_create_by(
    name: "Conrad"
)

User.create(
    name: "Melinda"
)

Joke.create(
    title: "Chicken Coop Joke",
    setup: "Why does a chicken coop only have two doors?",
    punchline: "Because if it had four doors, it'd be a chicken sedan!"
)

Joke.create(
    title: "Mermaid Joke",
    setup: "Why do mermaids wear seashells as bras?",
    punchline: "Because B-shells are too small!"
)

Joke.create(
    title: "Shovel Joke",
    setup: nil,
    punchline: "The invention of the shovel was a groundbreaking discovery."
)

Joke.create(
    title: "Duck Joke",
    setup: "What's a duck's favorite drug?",
    punchline: "Quack!"
)

Joke.create(
    title: "Ghost Joke",
    setup: "Why are ghosts banned from liquor stores?",
    punchline: "Because they steal all the boos!"
)

Joke.create(
    title: "Glasses Joke",
    setup: "You should wear glasses when doing math.",
    punchline: "It improves di-vision!"
)

Joke.create(
    title: "Holy Water Joke",
    setup: "How do you make holy water?",
    punchline: "You boil the hell out of it!"
)

Joke.create(
    title: "Jay-Z Joke"
    setup: "What does Jay-Z call Beyonce after proposing?"
    punchline: "Fiyonce Knowles!"
)