class AlterIncludeTimestampsInPointsHistories < ActiveRecord::Migration
	def change
        change_table(:points_histories) { |t| t.timestamps }
    end
end
