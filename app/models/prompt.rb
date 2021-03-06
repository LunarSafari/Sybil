class Prompt
  include ActionView::Helpers::UrlHelper
  include ApplicationHelper

  def initialize type, args = {}
    @type = type
    @args = args
  end

  def to_html
    case @type
    when :perspective
      character = @args[:character]
      concept = @args[:concept]
      "#{wrap_character character} 对 #{wrap_concept concept} 的观点是什么？"
    end.html_safe
  end

  def answer_url
    case @type
    when :perspective
      url_helpers.new_perspective_path(character_id: @args[:character].id, concept_id: @args[:concept].id)
    end
  end

  def wrap_character character
    link_to character.name, url_helpers.character_path(character)
  end

  def wrap_concept concept
    link_to concept.name, url_helpers.concept_path(concept)
  end
end
