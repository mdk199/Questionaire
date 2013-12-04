class PointsHistory < ActiveRecord::Base
	belongs_to :points_map
	attr_accessible :user_id, :points_map_id
	validates_presence_of :user_id, :points_map_id
end