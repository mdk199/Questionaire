class CreatePointsMapTable < ActiveRecord::Migration
  def up
  	create_table :points_maps do |t|
  		t.string :controller
  		t.string :action
  		t.integer :point
  	end
  end

  def down
  	drop_table :points_maps
  end
end
