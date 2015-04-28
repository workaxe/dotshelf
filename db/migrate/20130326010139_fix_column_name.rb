class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :related_words, :data, :body
  end

  def self.down
    # rename back if you need or do something else or do nothing
  end
end