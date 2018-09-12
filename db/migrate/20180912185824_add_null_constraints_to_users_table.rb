class AddNullConstraintsToUsersTable < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :full_name, :string, null: false
    change_column :users, :email, :string, null: false
  end
end
