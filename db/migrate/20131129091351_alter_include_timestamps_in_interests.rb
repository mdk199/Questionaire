class AlterIncludeTimestampsInInterests < ActiveRecord::Migration
	def change
        change_table(:interests) { |t| t.timestamps }
    end
end
