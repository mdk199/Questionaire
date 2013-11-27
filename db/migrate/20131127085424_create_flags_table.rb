class CreateFlagsTable < ActiveRecord::Migration
  def up
  	create_table :flags do |t|
  		t.integer :flagable_id
  		t.string :flagable_type
  	end
  end

  def down
  	drop_table :flags
  end
end
