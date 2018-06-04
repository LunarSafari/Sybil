class WorldsController < ApplicationController
  def index
    @worlds = current_user.worlds
  end

  def show
    @world = current_user.worlds.find(params[:id])
    render layout: 'world'
  end

  def new
    @world = World.new
  end

  def create
    @world = World.new(world_params)
    @world.world_ownerships.new(user: current_user, type: :owner)
    @world.save
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
