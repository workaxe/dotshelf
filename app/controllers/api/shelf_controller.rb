class Api::ShelfController < ApplicationController
  before_filter :authenticate_user!
  
  def remove
  
    if params[:domain_id].blank? || params[:shelf_id].blank?
      render :json => {:status => false, :error_text => t(:empties)}
    else
      @shelf = Shelf.find(params[:shelf_id])
      shelf_domain = @shelf.domains.find(params[:domain_id])
      
      if current_user.has_shelf_access(@shelf)
        if shelf_domain.destroy
          render :json => {:status => true}
        else
          render :json => {:status => false, :error_text => t(:wrong)}
        end
      else
        render :json => {:status => false, :error_text => t(:no_access)}
      end
      
    end
    
  end
  
  def add
    
    domain = params[:domain]
    
    if !params[:shelf_id].blank?
      @shelf = Shelf.find(params[:shelf_id])
      
      if !current_user.has_shelf_access(@shelf)
        @shelf = nil
      end
    elsif !params[:shelf_label].blank?
      conditions = { :label => params[:shelf_label], :shelf_type => 'domain_shelf' }
      @shelf = current_user.shelves.find(:first, :conditions => conditions) || current_user.shelves.create(conditions)
    end
    
    unless @shelf.blank?
      
      if domain == ""
        @saved_shelf = @shelf
      else
        conditions = { :body => get_body_from_domain(domain),
                       :tld => get_tld_from_domain(domain),
                       :full_body => domain,
                       :domain_type => 'default',
                       :user_id => current_user.id }
        
        @saved_shelf = @shelf.domains.find(:first, :conditions => conditions) || @shelf.domains.create(conditions)
      end
      
      if !@saved_shelf.blank?
        render :json => {:status => true, :domain_id => @saved_shelf.id, :shelf_id => @shelf.id}
      else
        render :json => {:status => false, :error_text => t(:wrong)}
      end
      
    else
      render :json => {:status => false, :error_text => t(:wrong)}
    end
    
  end
  
  def index
    
    all_shelves = []
    users_shelves = current_user.shelves.order('id DESC')
    users_access = current_user.shelf_accesses
    
    users_shelves.each do |s|
      all_shelves << s
    end
    
    users_access.each do |s|
      all_shelves << Shelf.find(s.shelf_id)
    end
    
    render :json => all_shelves.to_json(:include => :domains)
    
  end
  
  def accesses # i repeat myself here.
    if params[:shelf_id].blank?
      render :json => {:status => false, :error_text => t(:empties)}
    else
      
      @shelf = Shelf.find(params[:shelf_id])
      
      if current_user.has_object(@shelf)
        render :json => {:status => true, :accesses => @shelf.shelf_accesses }
      else
        render :json => {:status => false, :error_text => t(:no_access)}
      end
      
    end
  end
  
  def give_access # i repeat myself here.
    if params[:shelf_id].blank? || params[:email].blank?
      render :json => {:status => false, :error_text => t(:empties_email)}
    else
      
      @shelf = Shelf.find(params[:shelf_id])
      
      if current_user.has_object(@shelf)
        
        check_user = User.find_by_email(params[:email])
        
        conditions = { :access => "not_notified_editor",
                       :shelf_id => @shelf.id,
                       :email => params[:email] }
        
        check_access = @shelf.shelf_accesses.find(:first, :conditions => conditions)
        
        create_conditions = false
        
        if check_access.blank?
          if check_user.blank?
            message = t(:invited)
          else
            message = t(:accessed)
          end
          create_conditions = true
        else
          message = t(:already_invited)
        end
        
        if create_conditions == true
          
          #email
          
          if @shelf.shelf_accesses.create(conditions)
            render :json => {:status => true, :message => message}
          end
          
        else
          render :json => {:status => false, :error_text => t(:wrong)}
        end
        
      else
        render :json => {:status => false, :error_text => t(:no_access)}
      end
      
    end
  end
  
  def create
    conditions = { :label => params[:shelf_label], :shelf_type => 'domain_shelf' }
    @shelf = current_user.shelves.find(:first, :conditions => conditions) || current_user.shelves.create(conditions)
    @shelf.save
    render :json => {:status => true}
  end
  
  def destroy
    @shelf = Shelf.find(params[:shelf_id])
    
    if current_user.has_object(@shelf)
      @shelf.destroy
    end
    
    render :json => {:status => true}
  end
  
  private
  def get_body_from_domain(domain)
    s = domain.split(".")
    s[0]
  end
  
  def get_tld_from_domain(domain)
    s = domain.split(".")
    s[1]
  end
  
end
