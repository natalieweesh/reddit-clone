class CreateCommentsTable < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :parent_comment_id
      t.integer :link_id
      t.string :content
    end
  end

end
