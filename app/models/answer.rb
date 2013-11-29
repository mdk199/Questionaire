class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
belongs_to :question
has_many :document, as: :documentable
has_many :flag, as: :flagable

attr_accessible :answer, :user_id, :question_id
end
