class Api::DomainController < ApplicationController
  
  def check
    
    pro_reserve_count = 1
    
    if !params[:domains].blank?
      domains = params[:domains].split(',')
    elsif !params[:domain].blank?
      domains = [params[:domain]]
    end
    
    return_domains = []
    
    domains.each do |domain|
      if domain.length > 3
        check_watch_domain = WatchDomain.where(:full_body => domain).first
        
        if !check_watch_domain.blank? && check_watch_domain.expire_date > Date.today
          is_available = check_watch_domain.expire_date
        else
          begin
            is_available = Whois.whois(domain).expires_on
          rescue
            # nothing to do
          end
        end
        
        domains_score = domain_score(domain)
        
        unless is_available.blank?
          if check_watch_domain.blank?
            WatchDomain.create({
              :full_body => domain,
              :expire_date => Date.parse(is_available.to_s)
            })
          elsif check_watch_domain.expire_date != is_available
            check_watch_domain.expire_date = Date.parse(Whois.whois(domain).expires_on.to_s)
            check_watch_domain.save
          end
        end
        
        return_domains << {
          :domain => domain,
          :score => domains_score,
          :available => is_available.blank?
        }
      end
    end
    
    # Reserve pro domains
    pro_reserve_domains = []
    return_domains = return_domains.sort { |p1,p2| p2[:score] <=> p1[:score] }
    
    if return_domains.count > 3
      new_return_domains = []
      return_domains.each_with_index do |r,i|
        if pro_reserve_domains.length < pro_reserve_count && r[:available] == true
          pro_reserve_domains << r
        else
          new_return_domains << r
        end
      end

      return_domains = new_return_domains
    end
    
    # Reserve pro domains ended
    
    return_object = {
      :found => return_domains,
      :pro_domains => pro_reserve_domains
    }

    render :json => return_object
  end
   
  def endings
    @endings = Ending.all
    render json: @endings
  end
  
  def related_words
    
    max_length = 8
    word = params[:word]
    
    return_all_words = []
    all_words = get_all_from_wrodnik(word)
    
    check_db = RelatedWord.find_by_word(word).blank?
    
    if check_db
      
      check_all = false
      check_oth = false
      
      unless all_words.blank?
        check_all = true
        all_words.each do |word_node|
          if(word_node['relationshipType'] != 'antonym')

            add_this = []

            word_node['words'].each do |word|
              if word.length < max_length && !add_this.include?(word)
                add_this << word
              end
            end

            return_all_words << {
              :relationship_type => word_node['relationshipType'],
              :words => add_this
            }
          end
        end
      end

      bustaname_relateds = get_bustaname_relateds(word)

      unless bustaname_relateds.blank?
        check_oth = true

        add_this = []
        bustaname_relateds.each do |word|
          if word.length < max_length && !add_this.include?(word)
            add_this << word
          end
        end

        return_all_words << {
          :relationship_type => "other",
          :words => add_this
        }

      end


      # save to db
      if check_all && check_oth
        model_word = RelatedWord.find_or_create_by_word(word)
        model_word.body = return_all_words.to_json
        model_word.save
      end
      
    else
      
      model_word = RelatedWord.find_by_word(word)
      return_all_words = model_word.body
      
    end
    
    render :json => return_all_words
    
  end
  
  def push_to_analytics
    
    if current_user.blank?
      user_id = 0
    else
      user_id = current_user.id
    end
    
    if not params[:hash].blank?
      require "base64"
      hash_fix = Base64.decode64(params[:hash])
      hashes = hash_fix.split(",")
      
      hashes.each do |h|
        check_first = Analytic.find_by_report(h)
        if check_first.blank?
          Analytic.create(:report => h, :report_type => "domain", :user_id => user_id)
        end
      end
      render :json => { :status => true }
    end
  end
  
  private
  def domain_score(domain)
    
    return_score = 0
    
    scores = {
      :tld => { # max 4
        'com' => 4,
        'net' => 3,
        'org' => 2,
        'co'  => 3,
        'io'  => 2,
        'ly'  => 3,
        'me'  => 3,
        'else'=> 1
      },
      :len => { # max 4
        '1-4' => 4,
        '5' => 3.9,
        '6' => 3.5,
        '7' => 3,
        '8' => 2.5,
        '9' => 2.7,
        '10' => 2,
        '10-16' => 1,
        'more' => 0,
      },
      :shelf_scores => {
        :f => 1,
        :s => 2
      }
    }
    
    body = get_body_from_domain(domain)
    tld = get_tld_from_domain(domain)
    
    
    
    # TLD Quality Scoring
    
    tld_score = 0
    
    unless scores[:tld][tld].blank?
      tld_score = scores[:tld][tld]
    else
      tld_score = scores[:tld]['else']
    end
    
    # TLD Quality Scoring End
    
    
    # Domain Length Scoring
    
    domain_length = body.length
    dl_score = 0
    
    if domain_length <= 4
      dl_score = scores[:len]['1-4']
    elsif domain_length == 5  
      dl_score = scores[:len]['5']
    elsif domain_length == 6
      dl_score = scores[:len]['6']
    elsif domain_length == 7  
      dl_score = scores[:len]['7']
    elsif domain_length == 8  
      dl_score = scores[:len]['8']
    elsif domain_length == 9  
      dl_score = scores[:len]['9']
    elsif domain_length == 10
      dl_score = scores[:len]['10']
    elsif (domain_length > 10 && domain_length <= 16)
      dl_score = scores[:len]['10-16']
    else
      dl_score = scores[:len]['more']
    end
    
    # Domain Length Scoring Ended
    
    
    # CVCV Scoring (experimental)
    
    # cvcv_score = 0
    # cvcv_temp_score = 0
    # cons_repeat_penalty = 0
    # cvcv_last_type = 0 # 0:init, 1:vowel 2:not
    # cvcv_cons_count = 0
    # 
    # body.each_char do |c|
    #   
    #   if(c=='a'||c=='e'||c=='o'||c=='u') # 1
    #     
    #     cvcv_last_type = 1
    #     
    #   else # 2
    #     if cvcv_last_type == 2
    #       
    #       if cvcv_cons_count == 2
    #         cons_repeat_penalty = cons_repeat_penalty + 1
    #         cvcv_cons_count = 0
    #       else
    #         cvcv_cons_count = cvcv_cons_count + 1
    #       end
    #       
    #     end
    #     cvcv_last_type = 2
    #   end
    #   
    # end
    # 
    # cvcv_score = 2 - cons_repeat_penalty
    # 
    # if cvcv_cons_count >= 2
    #   cvcv_score = cvcv_score - 1
    # end
    
    # CVCV Scoring (experimental) Ended
    
    
    return_score = dl_score + tld_score# + cvcv_score
    
    return_score
  end
  
  def get_body_from_domain(domain)
    s = domain.split(".")
    s[0]
  end
  
  def get_tld_from_domain(domain)
    s = domain.split(".")
    s[1]
  end
  
  def fix_words_for_domain(str)
    str.gsub(/ /,'').gsub(/[^0-9A-Za-z]/, '')
  end
    
  def get_bustaname_relateds(word)
    require 'open-uri'
  	require 'json'
  	
    begin
      open("http://www.bustaname.com/suggest/word/#{word}", 'r', :read_timeout=>2) do |http|
        JSON.parse(http.read)
      end
    rescue
      # return empty response to client, so it will retry
    end
  end
  
  def get_all_from_wrodnik(word)
    require 'open-uri'
  	require 'json'
  	
    begin
      open("http://api.wordnik.com/v4/word.json/#{word}/relatedWords?useCanonical=true&limitPerRelationshipType=10&api_key=c0ee0a9685f0bcd56750702705807699611ebd8c15c351ed5", 'r', :read_timeout=>2) do |http|
        JSON.parse(http.read)
      end
    rescue
      # return empty response to client, so it will retry
    end
  end
    
end
