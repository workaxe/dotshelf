class ChangeEmailTypeFromIntegerToString < ActiveRecord::Migration
  def up
    change_column :shelf_accesses, :email, :string
  end

  def down
    
  end
end
