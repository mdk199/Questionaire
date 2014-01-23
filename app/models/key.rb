class Key < PasskeyBase
#establish_connection "passkey_#{Rails.env}"
serialize :key_pair
attr_accessible :key_pair,:ciphertext
	
	def self.decrypt
		"pass"
	end

	def self.key_pair
		Key.first.key_pair
	end

	def self.ciphertext
		Key.first.ciphertext
	end
end