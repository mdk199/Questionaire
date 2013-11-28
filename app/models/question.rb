class Question < ActiveRecord::Base
  belongs_to :user
  has_many :questions_tag
  has_many :tag, through: :questions_tag
  attr_accessible :question, :user_id
  has_many :document, as: :documentable
  has_many :flag, as: :flagable
end