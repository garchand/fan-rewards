class UpdateDefaultValues < ActiveRecord::Migration[7.0]
  def change
    # default values for campaigns
    change_column_default :campaigns, :reward_threshold, 0
    change_column_default :campaigns, :active, true

    change_column_default :restaurants, :name, ""
    change_column_null :restaurants, :name, false
    change_column_default :restaurants, :address, ""
    change_column_default :restaurants, :description, ""
  end
end
