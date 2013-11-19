class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.string :permalink
      t.text :content
      t.boolean :active

      t.timestamps
    end
  end
end
