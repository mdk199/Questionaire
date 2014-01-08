class Question < ActiveRecord::Base
  belongs_to :user
  has_many :documents, as: :documentable, :dependent => :destroy
  has_many :flags, as: :flagable, :dependent => :destroy
  has_many :answers, :inverse_of=>:question
  
  validates_presence_of :question, :user_id
  validate :valid_user
  
  acts_as_taggable

  attr_accessible :question, :user_id, :published, :tag_list

  searchable do
    text :question
    boolean :published

    text :user do 
      user.name
      user.email
      user.username
      user.profile
    end

    text :tags do
      tags.map { |tag| tag.name }
    end
    
    text :answers do
      answers.map {|answer| answer.answer}
    end
  end
  
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

    def approved_answer(question)
      answer = question.answers.where(:approved=>true).first
      answer.blank? ? nil : answer
    end

  end
end