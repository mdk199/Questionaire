class RemoveTimestampsFromQuestionsTags < ActiveRecord::Migration
  def up
    remove_column :questions_tags, :created_at
    remove_column :questions_tags, :updated_at
  end

  def down
    add_column :questions_tags, :updated_at, :string
    add_column :questions_tags, :created_at, :string
  end
end
