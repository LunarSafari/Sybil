class Concept < ApplicationRecord
  has_many :perspectives

  scope :not_character, -> { where('type != ?', 'CharacterConcept') }

  def character_concept?
    false
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
