class Comment < ActiveRecord::Base
  include PublicActivity::Common
  
	belongs_to :user
	belongs_to :answer, counter_cache: true
	validates_presence_of :comment
	attr_accessible :answer_id, :comment, :user_id
	validates_presence_of :user_id
  	validates_presence_of :answer_id
  	validate :valid_user, :valid_answer
  	def valid_user
  		if self.user_id.present?
	  		unless User.find_by_id(self.user_id).present?
	  			self.errors.add(:user_id, "not found!")
	  		end
	  	end
  	end

  	def valid_answer
  		if self.answer_id.present?
	  		unless Answer.find_by_id(self.answer_id).present?
	  			self.errors.add(:answer_id, "not found!")
	  		end
	  	end
  	end
  	after_save :touch_answer

	def touch_answer
		answer.touch
	end
end