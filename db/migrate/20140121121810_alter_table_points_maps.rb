class AlterTablePointsMaps < ActiveRecord::Migration
  def up
    remove_column :points_maps, :controller
    remove_column :points_maps, :action
    add_column :points_maps, :key, :string
  end

  def down
    add_column :points_maps, :controller, :string
    add_column :points_maps, :action, :string
    remove_column :points_maps, :key
  end
end
