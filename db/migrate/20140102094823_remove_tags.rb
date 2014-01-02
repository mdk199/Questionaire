class RemoveTags < ActiveRecord::Migration
  def up
    drop_table :questions_tags
    drop_table :tags
  end

  def down
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end

    create_table :questions_tags do |t|
      t.integer :questions_id
      t.integer :tags_id
    end
  end
end
