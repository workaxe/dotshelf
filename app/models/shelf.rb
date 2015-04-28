class Shelf < ActiveRecord::Base
  attr_accessible :label, :shelf_type, :user_id
  
  validates_presence_of :user_id
  
  has_many :shelf_accesses, :dependent => :destroy
  has_many :domains, :dependent => :destroy
  
  belongs_to :user
  
end
