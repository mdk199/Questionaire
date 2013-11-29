class AlterIncludeTimestampsInTags < ActiveRecord::Migration
	def change
        change_table(:tags) { |t| t.timestamps }
    end
end
