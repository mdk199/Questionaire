class CreateQuestionsTable < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.text :question
      t.text :tags
      t.string :owner, :limit => 50
      t.timestamps
    end
  end

  def down
    drop_table :questions
  end
end
