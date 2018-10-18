class PokemonsController < ApplicationController

  def capture  
      curTrainer = current_trainer # = current user; method predefined in Devise gem we use
      @pokemon = Pokemon.find(params[:id])
      @pokemon.update(trainer: curTrainer)
      redirect_to '/' 
  end
end
