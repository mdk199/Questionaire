class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag
  validates_presence_of :tag, :question
end