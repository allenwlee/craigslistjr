class CreatePostsTable < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.string :description
      t.string :email
      t.string :price
      t.references :category
    end
  end
end
