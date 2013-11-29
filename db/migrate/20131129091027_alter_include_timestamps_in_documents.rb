class AlterIncludeTimestampsInDocuments < ActiveRecord::Migration
	def change
        change_table(:documents) { |t| t.timestamps }
    end
end

