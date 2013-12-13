class Interest < ActiveRecord::Base
  belongs_to :user
  attr_accessible :user_id, :interest
  validates_presence_of :user_id, :interest
  validate :valid_user

  	def valid_user
  		if self.user_id.present?
	  		unless User.find_by_id(self.user_id).present?
	  			self.errors.add(:user_id, "not found!")
	  		end
	  	end
  	end
end