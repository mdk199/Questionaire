class User < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_one :expertise, :dependent => :destroy
  has_one :interest,:dependent => :destroy
  has_many :points_histories, :dependent => :destroy
  has_many :answers
  has_many :comments
  has_one :profile, :dependent => :destroy 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def my_expertise_questions
    tags = Tag.find(:all, :conditions => ["name in (?)", expertise.expertise.split(",")])
    questions = tags.map {|tag| tag.questions}.flatten.uniq
    questions.delete_if { |question| question.user_id == self.id }
  end
end
