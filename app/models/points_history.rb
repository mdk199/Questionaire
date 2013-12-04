class PointsHistory < ActiveRecord::Base
	belongs_to :points_map
	belongs_to :user

	attr_accessible :user_id, :points_map_id

	validates_presence_of :points_map, :points_history, :user
end