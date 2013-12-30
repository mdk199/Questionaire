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
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body

  ADMIN_ROLE = "Admin"
  USER_ROLE = "User"
  ROLES = [ADMIN_ROLE, USER_ROLE]

  def is_admin?
    role == User::ADMIN_ROLE
  end

  def is_user?
    role == User::USER_ROLE
  end

  def my_expertise_questions
    tags = expertise.present? ? Tag.find(:all, :conditions => ["name in (?)", expertise.expertise.split(",")]) : []
    questions = tags.map {|tag| tag.questions}.flatten.uniq
    questions.delete_if { |question| question.user_id == self.id }
    questions.keep_if { |question| question.published == true }
    questions.sort_by! {|q| q[:updated_at]}.reverse.take(5)    
  end

  def expertise_questions
    tags = expertise.present? ? Tag.find(:all, :conditions => ["name in (?)", expertise.expertise.split(",")]) : []
    questions = tags.map {|tag| tag.questions}.flatten.uniq
    questions.delete_if { |question| question.user_id == self.id }
    questions.keep_if { |question| question.published == true }
    questions.sort_by! {|q| q[:updated_at]}.reverse
  end

  def my_interest_questions
    tags = interest.present? ? Tag.find(:all, :conditions => ["name in (?)", interest.interest.split(",")]) : []
    questions = tags.map {|tag| tag.questions}.flatten.uniq
    questions.delete_if { |question| question.user_id == self.id }
    questions.keep_if { |question| question.published == true }
    questions.sort_by! {|q| q[:updated_at]}.reverse.take(5)
  end

  def interest_questions
    tags = interest.present? ? Tag.find(:all, :conditions => ["name in (?)", interest.interest.split(",")]) : []
    questions = tags.map {|tag| tag.questions}.flatten.uniq
    questions.delete_if { |question| question.user_id == self.id }
    questions.keep_if { |question| question.published == true }
    questions.sort_by! {|q| q[:updated_at]}.reverse
  end

  def profile_pic_url
    if profile.present?
      profile.photo.url(:medium)
    else
      "user.jpeg"
    end
  end

  def name
    profile.present? ? profile.fullname : username
  end
end
