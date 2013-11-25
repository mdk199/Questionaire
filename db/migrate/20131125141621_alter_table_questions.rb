class AlterTableQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :flagged, :boolean, :default => false
  end
end
