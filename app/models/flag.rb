class Flag < ActiveRecord::Base
 belongs_to :flagable, polymorphic: true
 attr_accessible :flagable_id, :flagable_type
 validates_presence_of :flaggable
end