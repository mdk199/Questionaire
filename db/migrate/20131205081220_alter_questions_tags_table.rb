class AlterQuestionsTagsTable < ActiveRecord::Migration
  def up
  	drop_table :questions_tags
  end

  def down
  	create_table :questions_tags do |t|
	t.integer :questions_id
	t.integer :tags_id
	end
  end
end
