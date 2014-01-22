class Key< ActiveRecord::Base
establish_connection "passkey_#{Rails.env}"
end