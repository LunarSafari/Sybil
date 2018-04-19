class WorldOwnership < ApplicationRecord
  belongs_to :world
  belongs_to :user

  self.inheritance_column = nil

  enum type: [:owner]
end

# == Schema Information
#
# Table name: world_ownerships
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  world_id   :integer
#  type       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_world_ownerships_on_user_id_and_world_id  (user_id,world_id) UNIQUE
#
