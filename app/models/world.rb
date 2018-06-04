class World < ApplicationRecord
  has_many :world_ownerships
  has_many :owner_ownerships, -> { owner }, class_name: 'WorldOwnership'
  has_many :owners, through: :owner_ownerships, source: :user

  has_many :character_concepts
  has_many :characters, through: :character_concepts
  has_many :concepts
  has_many :plots
end

# == Schema Information
#
# Table name: worlds
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
