class Key< ActiveRecord::Base
establish_connection "passkey_#{Rails.env}"
serialize :key_pair
attr_accessible :key_pair,:ciphertext
	
	def self.decrypt
		key = Key.key_pair
		cipher = Key.ciphertext
		plainkey = key.decrypt(cipher)
	end

	def self.key_pair
		Key.find(3).key_pair
	end

	def self.ciphertext
		Key.find(3).ciphertext
	end
end