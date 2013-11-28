class CreatePointsHistoryTable < ActiveRecord::Migration
  def up
  	create_table :points_histories do |t|
  		t.integer :user_id
  		t.integer :points_map_id
  		t.timestamp
  	end
  end

  def down
  	drop_table :points_histories
  end
end
