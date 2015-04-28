class Domain < ActiveRecord::Base
  attr_accessible :body, :domain_type, :full_body, :shelf_id, :tld, :user_id
  validates_presence_of :shelf_id, :user_id, :tld
  belongs_to :shelf
end
