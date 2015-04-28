class Ending < ActiveRecord::Base
  attr_accessible :content, :price, :title, :language
  validates_presence_of :content, :title, :language
end
