class RenameUserIdToEmail < ActiveRecord::Migration
  def self.up
    rename_column :shelf_accesses, :user_id, :email
  end
  
  def self.down
    rename_column :shelf_accesses, :email, :user_id
  end
end
