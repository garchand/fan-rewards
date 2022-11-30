class CreateRestaurantsAmbassadors < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurants_ambassadors do |t|
      t.references :restaurant, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
