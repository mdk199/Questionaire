class AlterPostedByToIntegerInQuestions < ActiveRecord::Migration
  def up
    change_column :questions, :posted_by, :integer
    rename_column :questions, :posted_by, :user_id
  end

  def down
    rename_column :questions, :user_id, :posted_by
    change_column :questions, :posted_by, :string
  end
end
