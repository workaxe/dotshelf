class AddMembershipTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :membership_type, :string
  end
end
