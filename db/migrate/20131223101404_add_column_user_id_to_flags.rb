class AddColumnUserIdToFlags < ActiveRecord::Migration
  def change
    add_column :flags, :user_id, :integer
  end
end
