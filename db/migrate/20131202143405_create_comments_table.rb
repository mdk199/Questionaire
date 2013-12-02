class CreateCommentsTable < ActiveRecord::Migration
  def up
  	create_table :comments do |t|
  		t.text :comment
  		t.integer :answer_id
  		t.integer :user_id
  		t.timestamps

  	end
  end

  def down
  	drop_table :comments
  end
end