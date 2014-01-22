class Answer < ActiveRecord::Base
	include PublicActivity::Common
  # attr_accessible :title, :body
	belongs_to :question, :inverse_of => :answers, counter_cache: true
	belongs_to :user
	has_many :documents, as: :documentable
	has_many :flags, as: :flagable, :dependent => :destroy
	has_many :comments, :dependent => :destroy
	attr_accessible :answer, :user_id, :question_id,:approved
	validates :answer, :presence => true
	validates_presence_of :user_id, :message=>"user not present" 
  	validates_presence_of :question_id
  	validate :valid_user, :valid_question

  	after_save :touch_question

  	def valid_user
		if self.user_id.present?
			unless User.find_by_id(self.user_id).present?
				self.errors.add(:user_id, "not found!")
			end
		end
	end

	def touch_question
		self.question.touch
		self.question.index
	end

	def valid_question
		if self.question_id.present?
			unless Question.find_by_id(self.question_id).present?
				self.errors.add(:question_id, "not found!")
			end
		end
	end

	def is_approved?
		approved == true ? true : false 
	end

	def approve
		question.answers.each{ |answer| answer.update_attribute(:approved, false) }
		self.update_attribute(:approved, true)
	end


end
