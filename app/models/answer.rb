class Answer < ActiveRecord::Base
  # attr_accessible :title, :body
belongs_to :question
has_many :document, as: :documentable
has_many :flag, as: :flagable
end
