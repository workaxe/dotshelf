class AddSuperToUsers < ActiveRecord::Migration
  def change
    add_column :users, :super, :boolean
  end
end
