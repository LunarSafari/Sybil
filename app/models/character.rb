class Character < ApplicationRecord
  has_many :perspectives
  has_one :character_concept
  has_one :world, through: :character_concept

  after_create do
    build_character_concept.save
  end
end

# == Schema Information
#
# Table name: characters
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  brief       :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
