class Expertise < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :expertise
  validates_presence_of :user, :expertise
end