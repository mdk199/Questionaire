class User < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_one :expertise, :dependent => :destroy
  has_one :interest,:dependent => :destroy
  has_many :answers
  has_many :comments
  has_one :profile, :dependent => :destroy 

  acts_as_tagger
  acts_as_taggable_on :expertises, :interests

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :expertise_list, :interest_list, :points, :role
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
    questions = Question.where("user_id != #{id} && published=true").tagged_with(expertise_list, :any=>true).limit(10).order("updated_at DESC")
  end

  def expertise_questions
    questions = Question.where("user_id != #{id} && published=true").tagged_with(expertise_list, :any=>true).order("updated_at DESC")
  end

  def my_interest_questions
    questions = Question.where("user_id != #{id} && published=true").tagged_with(interest_list, :any=>true).limit(10).order("updated_at DESC")
  end

  def interest_questions
    questions = Question.where("user_id != #{id} && published=true").tagged_with(interest_list, :any=>true).order("updated_at DESC")
  end

  def profile_pic_url(style)
    if profile.present?
      profile.photo.url(style)
    else
      "user_#{style.to_s}.jpeg"
    end
  end

  def name
    profile.present? ? profile.fullname : username
  end

  def my_points(user)
    user_array = User.where("users.id = #{user.id}").joins("INNER JOIN activities ON activities.owner_id = users.id INNER JOIN points_maps ON points_maps.key = activities.key").select("sum(point) as total_points,owner_id").group(:owner_id).order("total_points DESC")
  end
  

  class << self
    def top_contributors
      user = User.joins("INNER JOIN activities ON activities.owner_id = users.id INNER JOIN points_maps ON points_maps.key = activities.key").select("users.*, sum(points_maps.point) as total_points,activities.owner_id").group(:owner_id).order("total_points DESC").limit(3)
    end
  end

end
