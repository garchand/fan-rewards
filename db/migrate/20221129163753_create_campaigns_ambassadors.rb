class CreateCampaignsAmbassadors < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns_ambassadors do |t|
      t.references :campaign, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :client_code
      t.integer :referrals_count
      t.string :reward_status
      t.string :ambassador_code

      t.timestamps
    end
  end
end
