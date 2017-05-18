class CharacterConcept < Concept
  belongs_to :character, optional: true

  default_scope { preload :character }
  delegate :name, :description, to: :character

  def character_concept?
    true
  end
end

# == Schema Information
#
# Table name: concepts
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  description  :text(65535)
#  character_id :integer
#  type         :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
