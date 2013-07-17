class CreateLinkSubTable < ActiveRecord::Migration
  def change
    create_table :link_subs do |t|
      t.integer :link_id
      t.integer :sub_id
    end
  end

end
