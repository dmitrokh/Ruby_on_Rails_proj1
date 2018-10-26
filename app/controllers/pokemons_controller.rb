class PokemonsController < ApplicationController

  def capture  
      curTrainer = current_trainer # = current user; method predefined in Devise gem we use
      @pokemon = Pokemon.find(params[:id])
      @pokemon.update(trainer: curTrainer)
      redirect_to '/' 
  end

  def damage
      curTrainer = current_trainer # = current user; method predefined in Devise gem we use
      @pokemon = Pokemon.find(params[:id])
      h = @pokemon.health - 10
      if h <= 0 
          @pokemon.destroy
      else
          @pokemon.update(health: h)
      end
      
      redirect_to '/trainers/'+curTrainer.id.to_s 
  end

  def new
      @pokemon = Pokemon.new
  end

  def create
      pokemonName = pokemon_params[:name]
      ndex = pokemon_params[:ndex]
      @pokemon = Pokemon.new(name: pokemonName, ndex: ndex, health: 100, level: 1, trainer_id: current_trainer.id) 
     
      if @pokemon.save
          flash[:notice] = "You created a new Pokemon!"
          redirect_to '/trainers/'+current_trainer.id.to_s
      else
          flash[:error] = @pokemon.errors.full_messages.to_sentence
          render 'pokemons/new'
      end 
          
  end

  private
    # Using a private method to encapsulate the permissible parameters
    # is just a good pattern since you'll be able to reuse the same
    # permit list between create and update. Also, you can specialize
    # this method with per-user checking of permissible attributes.
    def pokemon_params
      params.require(:pokemon).permit(:name, :ndex)   #require makes sure key 'pokemon' is in the hash
    end                                               #permit returns only two values specified from the hash of values of 'pokemon' key 
end
