class PointsMap < ActiveRecord::Base
	has_many :points_history, :dependent => :destroy
	attr_accessible :key, :point
end