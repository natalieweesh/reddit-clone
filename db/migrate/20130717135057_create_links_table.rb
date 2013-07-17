class CreateLinksTable < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :title
      t.string :url
      t.string :text

      t.timestamps
    end
  end

end
