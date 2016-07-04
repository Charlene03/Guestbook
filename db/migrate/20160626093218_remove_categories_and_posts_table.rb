class RemoveCategoriesAndPostsTable < ActiveRecord::Migration
  def change
  	drop_table :posts_and_categories

  	create_table :categories_posts do |t|
      t.integer :post_id
      t.integer :category_id
 
      t.timestamps
    end
  end
end
