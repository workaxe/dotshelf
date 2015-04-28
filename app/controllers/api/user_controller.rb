class Api::UserController < ApplicationController
  def login
    find_user = User.find_by_email(params[:email])
    
    status = false
    if !find_user.blank?
      
      if find_user.valid_password?(params[:password])
        
        sign_in(:user, find_user)
        
        status = {
          :status => true
        }
      else
        status = {
          :status => false,
          :error_text => "#{t(:wrong_i)} <a href='/users/password/new'>#{t(:wrong_r)}</a>"
        }
      end
      
    else
      status = {
        :status => false,
        :error_text => t(:not_registered)
      }
    end
    
    render :json => status
  end

  def logout
    sign_out(current_user) if not current_user.nil? 
    render :json => {
      :status => true,
      :curr => current_user
    }
  end

  def signup
    email = params[:email]
    password = params[:password]
    password_confirmation = params[:password_confirmation]
    
    check_user = User.find_by_email(email)
    
    if !check_user.blank?
      status = {
        :status => false,
        :error_text => t(:email_already_registered)
      }
    elsif password.to_s != password_confirmation.to_s
      status = {
        :status => false,
        :error_text => t(:passwords_not_match)
      }
    elsif password.to_s.mb_chars.length < 8
      status = {
        :status => false,
        :error_text => t(:password_is_short)
      }
    else
      user = User.new({
          :email => email,
          :password_confirmation => password_confirmation,
          :password => password
      })
      if user.save
        status = {
          :status => true,
          :user => user
        }
      else
        warden.custom_failure!
        status = {
          :status => false,
          :error_text => user.errors
        }
      end
    end
    
    render :json => status
    
  end

  def update
  end
  
  def notifications
    
    if params[:seen]
      seen_access_ids = params[:seen]
      rrr=[]
      seen_access_ids.each do |aid|
        a = ShelfAccess.find(aid)
        if current_user.email == a.email
          rrr << a.id
          a.access = "editor"
          a.save
        end
      end
      
      render :json => {:status => true, :seen => rrr}
    else
      #
      notifications = []

      unless current_user.blank?
        check_accesses = current_user.shelf_accesses
          .select("access, created_at, id, shelf_id")
          .where(:access => "not_notified_editor")

        notifications = check_accesses

        new_notifications = []
        notifications.each do |n|
          new_notifications << {
            :n => n,
            :d => Shelf.select("shelves.*,users.email AS shelf_owner")
                    .where(:id => n.shelf_id)
                    .joins("INNER JOIN users ON shelves.user_id = users.id")
                    .first
          }
        end

        notifications = new_notifications
      end

      render :json => notifications
      #
    end
    
  end
  
end
