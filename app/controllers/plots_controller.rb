class PlotsController < ApplicationController
  def index
    @plots = Plot.all.order(id: :desc)
  end

  def show
    @plot = Plot.find(params[:id])
  end

  def new
    @plot = Plot.new
  end

  def edit
    @plot = Plot.find(params[:id])
  end

  def create
    @plot = Plot.create(plot_params)
    redirect_to plot_path(@plot)
  end

  def update
    @plot = Plot.find(params[:id])
    @plot.update(plot_params)
    redirect_to plot_path(@plot)
  end

  private
    def plot_params
      params.require(:plot).permit(:name, :description)
    end
end
