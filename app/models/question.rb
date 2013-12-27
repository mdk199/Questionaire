class Question < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  attr_accessible :question, :user_id, :published
  has_many :documents, as: :documentable, :dependent => :destroy
  has_many :flags, as: :flagable, :dependent => :destroy
  has_many :answers, :inverse_of=>:question
  validates_presence_of :question, :user_id
  validate :valid_user
  accepts_nested_attributes_for :tags , :allow_destroy => "true"
  attr_accessible :tags_attributes 
  
	def valid_user
		if self.user_id.present?
  		unless User.find_by_id(self.user_id).present?
  			self.errors.add(:user_id, "not found!")
  		end
  	end
	end

  class << self
    def all_published_questions(user=nil)
      if user.present?
        Question.where("user_id = #{user.id}")
      else
        Question.published_questions
      end
    end

    def published_questions
      Question.find(:all, :conditions => "published = 1")
    end

    def publish_question(question)
      question.published=true
      question.save
    end

    def unpublish_question(question)
      question.published=false
      question.save
    end

    def already_published(question)
      question.published==true ? true : false
    end

  end
end