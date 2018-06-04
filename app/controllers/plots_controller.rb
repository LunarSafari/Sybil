class PlotsController < ApplicationController
  before_action :load_world
  layout 'world'

  def index
    @plots = @world.plots.all.order(id: :desc)
  end

  def show
    @plot = @world.plots.find(params[:id])
  end

  def new
    @plot = @world.plots.new
  end

  def edit
    @plot = @world.plots.find(params[:id])
  end

  def create
    @plot = @world.plots.create(plot_params)
    redirect_to world_plot_path(@world, @plot)
  end

  def update
    @plot = @world.plots.find(params[:id])
    @plot.update(plot_params)
    redirect_to world_plot_path(@world, @plot)
  end

  private
    def plot_params
      params.require(:plot).permit(:name, :description)
    end
end
