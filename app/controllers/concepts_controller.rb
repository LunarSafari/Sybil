class ConceptsController < ApplicationController
  def index
    @concepts = Concept.not_character.all
  end

  def show
    @concept = Concept.find(params[:id])
    redirect_to character_path(@concept.character) if @concept.character_concept?
  end

  def edit
    @concept = Concept.find(params[:id])
  end

  def update
    @concept = Concept.find(params[:id])
    @concept.update(concept_params)
    redirect_to concept_path(@concept)
  end

  def new
    @concept = Concept.new
  end

  def create
    @concept = Concept.create(concept_params)
    redirect_to concept_path(@concept)
  end

  private

    def concept_params
      params.require(:concept).permit(:name, :description)
    end
end
