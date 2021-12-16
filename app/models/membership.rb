class Membership < ApplicationRecord
  validates :client_id, uniqueness: true, presence: true
  validates :gym_id, presence: true
  validates :charge, presence: true

  belongs_to :gym
  belongs_to :client
end
