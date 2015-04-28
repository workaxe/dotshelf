class CreateShelfAccesses < ActiveRecord::Migration
  def change
    create_table :shelf_accesses do |t|
      t.integer :shelf_id
      t.integer :user_id
      t.string :access

      t.timestamps
    end
    
    add_index :shelf_accesses, :shelf_id
    add_index :shelf_accesses, :user_id
  end
end
