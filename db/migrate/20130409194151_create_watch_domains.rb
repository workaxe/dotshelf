class CreateWatchDomains < ActiveRecord::Migration
  def change
    create_table :watch_domains do |t|
      t.string :full_body
      t.date :expire_date

      t.timestamps
    end
    
    
    add_index :watch_domains, :full_body
    add_index :watch_domains, :expire_date
  end
end
