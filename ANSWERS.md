# Q0: Why are these two errors being thrown?

db_migration error: Rails creates a schema_migrations table, composed of a single column named 'version' containing the most recent schema migration id string. The id string corresponds to the id string in db/schema.rb.If the version string in SchemaMigration#version doesn't match what is in db/schema.rb, you will get the 'Migrations are pending' exception. This sometimes happens if you setup a new system or do a clean OS install and then restore the database from a backup file, along with running 'rake db:migrate' - the version strings will get out of sync. The way to fix the problem is to simply insert a new row into the schema_migrations table, with the value contained in db/schema.rb - but only do this if you are certain the actual database matches the schema definition in schema.rb

uninitialized constant HomeController::Pokemon - due to the absense of class Pokemon

# Q1: How are the random Pokemon appearing? What is the common factor between all the possible Pokemon that appear? *

On each page reload, the code in the controller sends a query to the Pokemon db to extract all pokemons with no trainer. Then, by using "sample" method on array of pokemons, it returns a random pokemon from array.
trainerless_pokemon = Pokemon.where(trainer: nil)
    @pokemon = trainerless_pokemon.sample

# Question 2a: What does the following line do "<%= button_to "Throw a Pokeball!", capture_path(id: @pokemon), :class => "button medium", :method => :patch %>"? Be specific about what "capture_path(id: @pokemon)" is doing. If you're having trouble, look at the Help section in the README.

It generates a form containing one button that executes the POST route to capture function in controller; we use patch for method since we update data. 

# Question 3: What would you name your own Pokemon?

Dmytrosaur/Dmytrachu - either works

# Question 4: What did you pass into the redirect_to? If it is a path, what did that path need? If it is not a path, why is it okay not to have a path here?

If it's a question about the redirect_to inside the damage method in the pokemons controller, then I have 
redirect_to '/trainers/'+curTrainer.id.to_s
where /trainers/:id is a route to the show method in the trainers controller. This route requires a trainer's id for showing the pokemons of the current trainer.

# Question 5: Explain how putting this line "flash[:error] = @pokemon.errors.full_messages.to_sentence" shows error messages on your form.

Using flash above prints an error message in the form readable for a user. If an error occurs, the flash message about error is shown on the rendered web-page in a nice format. 

# Give us feedback on the project and decal below!

The project was cool, though I feel like much more cool stuff is coming)
The Decal is very interesting. Unfortunately, many things are still a mystery to me, but that's understandable since Rails is a new technology for me, and it's been only a few lectures when we learned about some serious things that can be done in Rails.
One thing that I would like to be done is that for instructions that we sometimes have to run there was some explanation about how they work. For example, we are often given some sequence of commands to execute either in the terminal or rails console, but no explanation about what they do provided. For example, in the today's lab one of the commands was 'rails generate devise User'. So it's interesting what's going on when this executed, how it differs from 'rails generate model User'. Or, another example, why we needed to shut down and start a rails server twice while installing a new gem.

# Extra credit: Link your Heroku deployed app
