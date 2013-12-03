class Flag < ActiveRecord::Base
 belongs_to :flagable, polymorphic: true
end