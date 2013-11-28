class Question < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  has_many :questions_tag
  has_many :tags through: :questions_tag


=======
  has_many :question_tag
  has_many :tag, through: :question_tag
>>>>>>> 6a70a19cf5da0c96f700cdd89d0263e65fe1b941
  attr_accessible :question, :user_id
  has_many :document, as: :documentable
end