class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :membership_type, :username
  
  #has_many :shelf_accesses, :dependent => :destroy
  has_many :shelves, :dependent => :destroy
  has_many :payment_notifications


  def has_object(obj)
    obj.user_id == self.id
  end
  
  def shelf_accesses
    ShelfAccess.where(:email => self.email)
  end
  
  def has_shelf_access(shelf)
    self.has_object(shelf) || !self.shelf_accesses.where(:shelf_id => shelf.id).first.blank?
  end
  
  def all_shelves
    r = []
    user_accesses = ShelfAccess.where(:user_id => self.id)
    user_shelves = self.shelves
    
    user_accesses.each do |access|
      r << Shelf.find(access.shelf_id)
    end
    user_shelves.each do |shelf|
      r << shelf
    end
    r
  end
  
  def buy_pro_url
    values = {
      :business => 'emir@workaxe.com',
      :cmd => '_cart',
      :upload => 1,
      :return => "https://dotshelf.pagekite.me/",
      :invoice => self.id,
      :amount_1 => 5.99,
      :item_name_1 => "Dotshelf Pro (1 Month)",
      :item_number_1 => 1,
      :quantity_1 => 1,
      :notify_url => "https://dotshelf.pagekite.me/payment_notifications"
    }
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end
  
  def panel_password
    require 'digest/md5'
    mds = Digest::MD5.hexdigest(self.encrypted_password)
    mds = mds[0,10]
    mde = Digest::MD5.hexdigest(self.id.to_s)
    mde = mde[0,4]
    mma = self.email.to_s[0,2]
    mps = "#{mds}#{mma}#{mde}"
  end
  
  def is_super_user?
    self.super
  end
  
end
