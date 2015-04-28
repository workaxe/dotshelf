class PaymentNotification < ActiveRecord::Base
  attr_accessible :params, :user_id, :status, :transaction_id

  belongs_to :user
  serialize :params
  after_create :mark_user_as_pro
  
  private
  def mark_user_as_pro
    if status == "Completed"
      User.find(params[:invoice]).update_attribute(:membership_type, "pro")
      #render :text => user_id
    end
  end
  
end
