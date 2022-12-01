class Campaign < ApplicationRecord
  belongs_to :restaurant
  has_many :campaigns_ambassadors
  has_many :users, through: :campaigns_ambassadors
  has_one_attached :photo

  validates :description, presence: true
  validates :client_benefit, presence: true
  validates :ambassador_reward, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :reward_threshold, presence: true
end
