class Registrar < ActiveRecord::Base
  attr_accessible :extra, :name, :url_param
  validates_presence_of :name, :url_param
  has_many :registrar_tlds
end
