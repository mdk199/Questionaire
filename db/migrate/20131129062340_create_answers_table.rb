class CreateAnswersTable < ActiveRecord::Migration
  def up
  	create_table :answers do |t|
  		t.text :answer
  		t.string :posted_by
  		t.integer :question_id
      t.timestamps
    end
  end

  def down
  	drop_table :answers
  end
end
