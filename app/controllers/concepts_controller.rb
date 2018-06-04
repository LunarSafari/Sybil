class ConceptsController < ApplicationController
  before_action :load_world
  layout 'world'

  def index
    @concepts = @world.concepts.not_character.all
  end

  def show
    @concept = @world.concepts.find(params[:id])
    redirect_to character_path(@concept.character) if @concept.character_concept?
  end

  def edit
    @concept = @world.concepts.find(params[:id])
  end

  def update
    @concept = @world.concepts.find(params[:id])
    @concept.update(concept_params)
    redirect_to world_concept_path(@world, @concept)
  end

  def new
    @concept = @world.concepts.new
  end

  def create
    @concept = @world.concepts.create(concept_params)
    redirect_to world_concept_path(@world, @concept)
  end

  private

    def concept_params
      params.require(:concept).permit(:name, :description)
    end
end
