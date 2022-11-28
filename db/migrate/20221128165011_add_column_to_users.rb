class AddColumnToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :user, :first_name, :string
    add_column :user, :last_name, :string
    add_column :user, :username, :string
  end
end
