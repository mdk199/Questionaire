class AlterTableQuestions < ActiveRecord::Migration
  def change
	add_column :questions, :flags_count, :integer, :default => 0
  end
end
