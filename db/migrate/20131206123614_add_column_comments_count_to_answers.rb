class AddColumnCommentsCountToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :comments_count, :integer, :default => 0
  end
end
