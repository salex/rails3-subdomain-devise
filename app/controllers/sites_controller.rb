class SitesController < ApplicationController
  
  def index
    @site = Site.find_by_name(current_subdomain)
  end
  
  def opps
    @site = Site.find_by_name(current_subdomain)
  end

end
