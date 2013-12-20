class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :dob
      t.string :street
      t.string :city
      t.string :state
      t.string :pin
      t.string :country
      t.string :mobile
      t.references :user

      t.timestamps
    end
  end
end
