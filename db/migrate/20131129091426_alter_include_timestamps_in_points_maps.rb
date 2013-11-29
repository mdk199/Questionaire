class AlterIncludeTimestampsInPointsMaps < ActiveRecord::Migration
	def change
        change_table(:points_maps) { |t| t.timestamps }
    end
end
