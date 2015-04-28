class ProController < ApplicationController
  before_filter :authenticate_user!
  
  def show
    # render :text => paypal_url("http://google.com")
  end
  
  def notification
    
  end
  
end
