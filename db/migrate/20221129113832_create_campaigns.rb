class CreateCampaigns < ActiveRecord::Migration[7.0]
  def change
    create_table :campaigns do |t|
      t.string :description
      t.string :client_benefit
      t.string :ambassador_reward
      t.datetime :start_date
      t.datetime :end_date
      t.integer :reward_threshold
      t.boolean :active
      t.references :restaurant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
