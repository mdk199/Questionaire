class CreateAnswersTable < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.text :answer
      t.string :owner, :limit => 50
      t.timestamps
    end
  end

  def down
    drop_table :answers
  end
end
