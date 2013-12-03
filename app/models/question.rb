class Question < ActiveRecord::Base
  belongs_to :user
  has_many :questions_tags
  has_many :tags, through: :questions_tags
  attr_accessible :question, :user_id
  has_many :documents, as: :documentable
  has_many :flags, as: :flagable

  validates_presence_of :question, :user_id
end