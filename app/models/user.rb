class User < ApplicationRecord
  has_secure_password
  has_many :world_ownerships
  has_many :worlds, through: :world_ownerships
end

# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
