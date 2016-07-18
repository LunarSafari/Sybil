class HomeController < ApplicationController
  def index
    @prompts = get_todos.map{|character, concept| Prompt.new :perspective, character: character, concept: concept }
  end

  private
    def get_todos
      concepts = Concept.all
      characters = Character.preload(:perspectives).all

      concepts = characters.map do |character|
        character_concepts_ids = character.perspectives.map(&:concept_id)
        concepts.reject do |concept|
          character_concepts_ids.include?(concept.id)
        end
      end
      todos = characters.zip(concepts).map do |character, concepts|
        z = concepts.map do |concept|
          [character, concept]
        end
      end.inject(:concat)
    end

end
