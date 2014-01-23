class CreateKeysTable < ActiveRecord::Migration
  def up
  	create_table :keys do |t| 
  		t.binary :ciphertext
  		t.text :key_pair
  	end
  end

  def down
  	drop_table :keys
  end
end
