class PointsMap < ActiveRecord::Base
	has_many :points_history
	attr_accessible :controller, :action, :point
	validates_presence_of :controller, :action, :point
end