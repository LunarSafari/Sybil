class PerspectivesController < ApplicationController

  def index
    @character = Character.find(params[:character_id])
    @perspectives = @character.perspectives
  end

  def new
    @character = Character.find(params[:character_id])
    @concept = Concept.find(params[:concept_id])
    @perspective = Perspective.new
  end

  def create
    @character = Character.find(params[:character_id])
    @concept = Concept.find(params[:concept_id])
    @perspective = Perspective.create(perspective_params)
    @perspective.assign_attributes(character: @character, concept: @concept)
    @perspective.save
    redirect_to character_perspectives_path(@perspective.character)
  end

  private
    def perspective_params
      params.require(:perspective).permit(:content)
    end
end
