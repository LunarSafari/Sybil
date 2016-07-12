class PerspectivesController < ApplicationController

  def index
    @character = Character.find(params[:character_id])
    @perspectives = @character.perspectives
  end
end
