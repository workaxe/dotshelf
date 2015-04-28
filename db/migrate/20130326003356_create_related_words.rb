class CreateRelatedWords < ActiveRecord::Migration
  def change
    create_table :related_words do |t|
      t.string :word
      t.text :data

      t.timestamps
    end
    
    add_index :related_words, :word
    
  end
end
