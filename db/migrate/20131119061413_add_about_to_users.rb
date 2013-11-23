class AddAboutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :about, :text
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :location, :string
    add_column :users, :birthday, :date
  end
end
