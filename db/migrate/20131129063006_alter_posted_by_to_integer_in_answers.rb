class AlterPostedByToIntegerInAnswers < ActiveRecord::Migration
  def up
  	change_column :answers, :posted_by, :integer
    rename_column :answers, :posted_by, :user_id
  end

  def down
  	rename_column :answers, :user_id, :posted_by
  	change_column :answers, :posted_by, :string
  end
end
