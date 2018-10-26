class TrainersController < ApplicationController
  before_action :authenticate_trainer!

  def index
    @trainers = Trainer.all
  end

  def show
    @curTrainer = current_trainer
    @trainer = Trainer.find(params[:id])
    @trainerPokemons = @trainer.pokemons
  end

end
