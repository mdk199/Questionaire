class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
	belongs_to :question
	has_many :documents, as: :documentable
	has_many :flags, as: :flagable
	has_many :comments
	attr_accessible :answer, :user_id, :question_id
end
