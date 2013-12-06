class User < ActiveRecord::Base
  has_many :questions, :dependent => :destroy
  has_many :expertises, :dependent => :destroy
  has_many :interests,:dependent => :destroy
  has_many :points_histories, :dependent => :destroy
  has_many :answers
  has_many :comments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
end
