class Perspective < ApplicationRecord
  belongs_to :character
  belongs_to :concept
end

# == Schema Information
#
# Table name: perspectives
#
#  id           :integer          not null, primary key
#  character_id :integer
#  concept_id   :integer
#  type         :string(255)
#  content      :text(65535)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
