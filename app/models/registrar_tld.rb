class RegistrarTld < ActiveRecord::Base
  attr_accessible :price, :registrar_id, :tld
  validates_presence_of :registrar_id, :tld
  belongs_to :registrar
end
