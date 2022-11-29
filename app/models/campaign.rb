class Campaign < ApplicationRecord
  belongs_to :restaurant

  validates :description, presence: true
  validates :client_benefit, presence: true
  validates :ambassador_reward, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :reward_threshold, presence: true
  validates :active, presence: true
end
