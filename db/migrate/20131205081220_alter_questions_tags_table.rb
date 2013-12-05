class AlterQuestionsTagsTable < ActiveRecord::Migration
  def up
  	drop_table :questions_tags
  end

  def down
  	create_table :questions_tags do |t|
	t.integer :question_id
	t.integer :tag_id
	end
  end
end
