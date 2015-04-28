class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
      t.integer :shelf_id
      t.integer :user_id
      t.string :body
      t.string :tld
      t.string :full_body
      t.string :domain_type

      t.timestamps
    end
    
    
    add_index :domains, :shelf_id
    add_index :domains, :user_id
    
  end
end
