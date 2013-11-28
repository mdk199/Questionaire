class Question < ActiveRecord::Base
  belongs_to :user
  has_many :question_tag
  has_many :tag, through: :question_tag
  attr_accessible :question, :user_id
  has_many :document, as: :documentable
end