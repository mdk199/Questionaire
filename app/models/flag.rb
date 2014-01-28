class Flag < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :flagable, polymorphic: true, counter_cache: true
  belongs_to :user
  attr_accessible :flagable_id, :flagable_type, :user_id
  validates_presence_of :flagable

  class << self
    def add_flag(object, current_user)
      flag = object.flags.find_by_user_id(current_user.id)
      if flag.blank? && object.flags.count < 5  
        object.flags.create(:user_id => current_user.id)
      end
    end

    def remove_flag(object, current_user)
      flag = object.flags.find_by_user_id(current_user.id)
      flag.destroy if flag.present?
    end

    def already_flagged(object, current_user)
      object.flags.find_by_user_id(current_user.id) ? true : false
    end
  end
end