class RemoveBirthdayFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :birthday
    remove_column :users, :facebook
    remove_column :users, :location
    remove_column :users, :twitter
    remove_column :users, :about
  end

  def down
    add_column :users, :twitter, :string
    add_column :users, :location, :string
    add_column :users, :facebook, :string
    add_column :users, :birthday, :date
    add_column :users, :about, :text
  end
end
