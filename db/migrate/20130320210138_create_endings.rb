class CreateEndings < ActiveRecord::Migration
  def change
    create_table :endings do |t|
      t.string :title
      t.text :content
      t.integer :price, :default => 0

      t.timestamps
    end
  end
end
