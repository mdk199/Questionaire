class AlterIncludeTimestampsInFlags < ActiveRecord::Migration
 	def change
        change_table(:flags) { |t| t.timestamps }
    end
end

