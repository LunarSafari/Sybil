class ConceptsController < ApplicationController
  def index
    @concepts = Concept.all
  end

  def show
    @concept = Concept.find(params[:id])
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
