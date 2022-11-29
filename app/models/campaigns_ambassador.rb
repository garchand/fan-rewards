class CampaignsAmbassador < ApplicationRecord
  belongs_to :campaign
  belongs_to :ambassador

  validates :client_code, presence: true
  validates :referrals_count, presence: true
  validates :reward_status, presence: true
  validates :ambassador_code, presence: true
end
