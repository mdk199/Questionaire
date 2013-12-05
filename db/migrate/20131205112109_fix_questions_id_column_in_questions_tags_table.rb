class FixQuestionsIdColumnInQuestionsTagsTable < ActiveRecord::Migration
  def change
  	rename_column :questions_tags, :questions_id, :question_id
  	rename_column :questions_tags, :tags_id, :tag_id
  end
end
