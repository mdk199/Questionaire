class Question < ActiveRecord::Base
  belongs_to :user
  has_many :questions_tag
  has_many :tags through: :questions_tag


  attr_accessible :question, :user_id
end