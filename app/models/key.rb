class Key < ActiveRecord::Base
ActiveRecord::Base.establish_connection(
	:adapter  => "mysql2",
	:database => "passkeys",
  	:username => "mandeep",
  	:password => "mypass")
serialize :key_pair
attr_accessible :key_pair,:ciphertext
	
	def self.decrypt
		key = Key.key_pair
		cipher = Key.ciphertext
		plainkey = key.decrypt(cipher)
	end

	def self.key_pair
		Key.first.key_pair
	end

	def self.ciphertext
		Key.first.ciphertext
	end
end