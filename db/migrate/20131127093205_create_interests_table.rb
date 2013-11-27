class CreateInterestsTable < ActiveRecord::Migration
  def up
  	create_table :interests do |t|
  		t.integer :user_id
  		t.string :interest
  	end
  end

  def down
  	drop_table :interests
  end
end
