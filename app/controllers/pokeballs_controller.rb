class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon

    # random_boolean = [true, false].sample
    # if random_boolean
    random_chance = rand(1..2)
    if random_chance == 1
      @pokeball.save
      redirect_to trainer_path(@pokeball.trainer), notice: "You caught this Pokemon!"
    else
      redirect_to pokemon_path(@pokeball.pokemon)
      flash[:alert] = "Your Pokéball missed! Try again"
    end
  end

  def destroy
    @pokeball = Pokeball.find(params[:id])
    # raise
    @pokeball.destroy
    redirect_to trainer_path(@pokeball.trainer), status: :see_other
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:trainer_id, :location, :caught_on)
  end
end
