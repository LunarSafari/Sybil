class CharactersController < ApplicationController

  def index
    @characters = Character.all
  end

  def show
    @character = Character.find(params[:id])
    perspectives = @character.perspectives
    ids = perspectives.pluck(:id)
    unknown = Concept.where.not(id: ids).limit(5)
    @prompts = unknown.map {|concept| Prompt.new :perspective, character: @character, concept: concept }
  end

  def edit
    @character = Character.find(params[:id])
  end

  def update
    @character = Character.find(params[:id])
    @character.update(character_params)
    redirect_to character_path(@character)
  end

  def new
    @character = Character.new
  end

  def create
    @character = Character.create(character_params)
    redirect_to character_path(@character)
  end

  private

    def character_params
      params.require(:character).permit(:name, :brief, :description)
    end
end
