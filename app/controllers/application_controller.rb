class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  private  
  def check_locale
    
    @geoip ||= GeoIP.new("#{::Rails.root}/db/GeoIP.dat")    
    remote_ip = request.remote_ip 
    
    if remote_ip == "127.0.0.1"
      remote_ip = "85.96.76.5"
    end  
    
    location_location = @geoip.country(remote_ip)
    if location_location != nil     
      location_location[:country_code2]
    end
    
  end
  
  def set_locale
        
    country_code = check_locale
    lang_from_ip = ""
    
    if country_code == "TR"
      lang_from_ip = "tr"
    #elsif country_code == "AZ"
    #  lang_from_ip = "az"
    else
      lang_from_ip = "en"
    end
    
    I18n.locale = session[:l] || params[:l] || lang_from_ip || I18n.default_locale
  end
end
