class Plot < ApplicationRecord
  belongs_to :world
end

# == Schema Information
#
# Table name: plots
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text(65535)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  world_id    :integer
#
