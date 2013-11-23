class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.date :birthday
      t.string :location
      t.string :facebook
      t.string :twitter
      t.text :about

      t.timestamps
    end
  end
end
