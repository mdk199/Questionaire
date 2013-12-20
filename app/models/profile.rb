class Profile < ActiveRecord::Base
  belongs_to :user

  attr_accessible :city, :country, :dob, :first_name, :last_name, :mobile, :pin, :state, :street, :user_id, :photo

  validates :first_name, :last_name, :dob, :user_id, :presence => true

  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "30x30>" }, :default_url => "/assets/user.jpeg"

  def fullname
    [first_name, last_name].join(" ")
  end
end
