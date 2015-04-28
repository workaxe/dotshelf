class ServeController < ApplicationController
  def index
    @endings_all_json = Ending.all.to_json
    
    @endings = {
      :en => Ending.find_all_by_language("en"),
      :tr => Ending.find_all_by_language("tr"),
      :az => Ending.find_all_by_language("az")
    }
  end
  
  def test
    ResellerClub::authentication("458294", "29882988ABcd@@")
    render :text => Customer.search("name" => "David")
  end
end
