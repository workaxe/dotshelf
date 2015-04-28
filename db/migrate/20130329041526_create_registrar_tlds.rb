class CreateRegistrarTlds < ActiveRecord::Migration
  def change
    create_table :registrar_tlds do |t|
      t.string :tld
      t.integer :price
      t.integer :registrar_id

      t.timestamps
    end
  end
end
