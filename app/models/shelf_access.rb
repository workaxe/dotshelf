class ShelfAccess < ActiveRecord::Base
  attr_accessible :access, :shelf_id, :email
  
  validates_presence_of :shelf_id, :email
  
  #belongs_to :users
  belongs_to :shelves
end
