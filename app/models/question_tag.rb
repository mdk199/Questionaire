class QuestionTag < ActiveRecord::Base
  belongs_to :question
  belongs_to :tag, :dependent=> :destroy
  validates_presence_of :tag, :question
end