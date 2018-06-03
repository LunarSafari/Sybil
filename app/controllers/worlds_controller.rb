class WorldsController < ApplicationController
  def index
    @worlds = current_user.worlds
  end

  def show
    @world = current_user.worlds.find(params[:id])
  end

  def new
    @world = World.new
  end

  def create
    @world = World.create(world_params)
    redirect_to world_path(@world)
  end

  def edit
    @world = World.find(params[:id])
  end

  def update
    @world = World.find(params[:id])
    @world.update(world_params)
    redirect_to world_path(@world)
  end

  private
    def world_params
      params.require(:world).permit(:name, :description)
    end
end
