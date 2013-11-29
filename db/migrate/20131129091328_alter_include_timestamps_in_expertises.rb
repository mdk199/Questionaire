class AlterIncludeTimestampsInExpertises < ActiveRecord::Migration
	def change
        change_table(:expertises) { |t| t.timestamps }
    end
end
