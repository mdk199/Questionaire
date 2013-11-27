class CreateQuestionsTagsTable < ActiveRecord::Migration
  def up
  	create_table :questions_tags do |t|
  		t.integer :questions_id
  		t.integer :tags_id
  	end
  end

  def down
  	drop_table :questions_tags
  end
end
