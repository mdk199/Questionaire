class AlterTableAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :question_id, :integer
    add_column :answers, :approved, :boolean, :default => false
    add_column :answers, :flagged, :boolean, :default => false
  end
end
