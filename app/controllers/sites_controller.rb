class SitesController < ApplicationController
  
  def index
    @site = Site.find_by_name!(request.subdomain)
  end
  
  def opps
    @site = Site.find_by_name!(request.subdomain)
    
  end

end
