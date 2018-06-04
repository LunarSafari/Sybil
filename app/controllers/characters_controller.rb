class CharactersController < ApplicationController
  before_action :load_world
  layout 'world'

  def index
    @characters = @world.characters.all
  end

  def show
    @character = @world.characters.find(params[:id])
    perspectives = @character.perspectives
    ids = perspectives.pluck(:concept_id)
    unknown = @world.concepts.where.not(id: ids).limit(5)
    @prompts = unknown.map {|concept| Prompt.new :perspective, character: @character, concept: concept }
    @concepts = @world.concepts.joins(:perspectives).where(perspectives: {character_id: @character.id})
  end

  def edit
    @character = @world.characters.find(params[:id])
  end

  def update
    @character = @world.characters.find(params[:id])
    @character.update(character_params)
    redirect_to world_character_path(@world, @character)
  end

  def new
    @character = @world.characters.new
  end

  def create
    @character = @world.characters.create(character_params)
    redirect_to world_character_path(@world, @character)
  end

  private

    def character_params
      params.require(:character).permit(:name, :brief, :description)
    end
end
