class CreateDocumentsTable < ActiveRecord::Migration
  def up
  	create_table :documents do |t|
  		t.integer :documentable_id
  		t.string :documentable_type
  		t.binary :document
  	end
  end

  def down
  	drop_table :documents
  end
end
