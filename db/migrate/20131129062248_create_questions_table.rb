class CreateQuestionsTable < ActiveRecord::Migration
  def up
  	create_table :questions do |t|
  		t.text :question
  		t.string :posted_by , :limit => 50
  		t.timestamps
  	end
  end

  def down
  	drop_table :questions
  end
end
