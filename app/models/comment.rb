class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :answer
  attr_accessible :answer_id, :comment, :user_id
  validates_presence_of :answer_id, :user_id, :comment
end
