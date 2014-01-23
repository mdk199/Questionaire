class PasskeyBase < ActiveRecord::Base
	self.abstract_class = true
	ActiveRecord::Base.establish_connection(
	:adapter  => "mysql2",
	:database => "passkeys",
  	:username => "mandeep",
  	:password => "mypass")
end