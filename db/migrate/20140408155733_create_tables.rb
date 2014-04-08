class CreateTables < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :author
      t.string :title
      t.string :url
      t.integer :vote

      t.timestamps
    end

    create_table :comments do |t|
      t.string :author
      t.text :comment
      t.integer :commentable_id
      t.string :commentable_type

      t.timestamps
    end
  end
end
