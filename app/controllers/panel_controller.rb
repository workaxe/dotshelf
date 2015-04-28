class PanelController < ApplicationController
  before_filter :authenticate_user!
  
  def customer
    # falan filan address var bilmemneee asdad
    render :text => current_user.panel_password
  end

  def domain
  end

  def reseller
  end

  def order
  end

  def contact
  end
  
end
