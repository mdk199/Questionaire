class Tag < ActiveRecord::Base
  TAG_TYPES = { 
                0=>"default",
                1=>"primary",
                2=>"success",
                3=>"info",
                4=>"warning",
                5=>"danger",
              }
end