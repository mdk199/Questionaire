class CreateExpertisesTable < ActiveRecord::Migration
  def up
  	create_table :expertises do |t|
  		t.integer :user_id
  		t.string :expertise
  	end
  end

  def down
  	drop_table :expertises
  end
end
