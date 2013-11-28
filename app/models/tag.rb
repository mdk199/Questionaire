class Tag < ActiveRecord::Base
  has_many :question_tag
  has_many :question, through: :question_tag

  
end