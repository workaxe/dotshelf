class CreateRegistrars < ActiveRecord::Migration
  def change
    create_table :registrars do |t|
      t.string :name
      t.string :extra
      t.text :url_param

      t.timestamps
    end
  end
end
