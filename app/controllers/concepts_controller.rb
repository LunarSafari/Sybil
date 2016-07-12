class ConceptsController < ApplicationController
  def index
    @concepts = Concept.all
  end

  def show
    @concept = Concept.find(params[:id])
  end

  def edit

  end

  def update

  end

  def create

  end
end
