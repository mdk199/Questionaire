class AddColumnRolesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, :default => User::USER_ROLE
  end
end
