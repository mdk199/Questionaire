class AlterIncludeTimestampsInQuestionsTags < ActiveRecord::Migration
	def change
        change_table(:questions_tags) { |t| t.timestamps }
    end
end

