class CreateShelves < ActiveRecord::Migration
  def change
    create_table :shelves do |t|
      t.string :label
      t.integer :user_id
      t.string :shelf_type

      t.timestamps
    end
    add_index :shelves, :user_id
  end
  
end
