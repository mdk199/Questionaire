class AddColumnQuestionsCounttoTags < ActiveRecord::Migration
def change
    add_column :tags, :questions_count, :integer, :default => 0
  end
end
