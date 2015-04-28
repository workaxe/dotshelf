class WatchDomain < ActiveRecord::Base
  attr_accessible :expire_date, :full_body
  validates_presence_of :expire_date, :full_body
end
