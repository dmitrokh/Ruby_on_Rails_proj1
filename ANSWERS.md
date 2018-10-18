# Q0: Why are these two errors being thrown?

db_migration error: Rails creates a schema_migrations table, composed of a single column named 'version' containing the most recent schema migration id string. The id string corresponds to the id string in db/schema.rb.If the version string in SchemaMigration#version doesn't match what is in db/schema.rb, you will get the 'Migrations are pending' exception. This sometimes happens if you setup a new system or do a clean OS install and then restore the database from a backup file, along with running 'rake db:migrate' - the version strings will get out of sync. The way to fix the problem is to simply insert a new row into the schema_migrations table, with the value contained in db/schema.rb - but only do this if you are certain the actual database matches the schema definition in schema.rb

uninitialized constant HomeController::Pokemon - due to the absense of class Pokemon

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

On each page reload, the code in the controller sends a query to the Pokemon db to extract all pokemons with no trainer. Then, by using "sample" method on array of pokemons, it returns a random pokemon from array.
trainerless_pokemon = Pokemon.where(trainer: nil)
    @pokemon = trainerless_pokemon.sample

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

# Question 3: What would you name your own Pokemon?

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

# Give us feedback on the project and decal below!

# Extra credit: Link your Heroku deployed app
