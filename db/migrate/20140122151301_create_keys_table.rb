class CreateKeysTable < ActiveRecord::Migration
  def up
  	create_table :keys do |t| 
  		t.string :ciphertext
  		t.text :key_pair
  	end
  end

  def down
  	drop_table :keys
  end
end
