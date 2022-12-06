class AddDefaultValuesToCampaignsAmbassadors < ActiveRecord::Migration[7.0]
  def change
    change_column_default :campaigns_ambassadors, :referrals_count, 0
    change_column_default :campaigns_ambassadors, :reward_status, "pending"
  end
end
