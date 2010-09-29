class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  helper_method :current_subdomain, :check_my_subdomain
  before_filter :current_subdomain


  def current_subdomain
      if request.subdomain.present? && request.subdomain != "www"
        current_subdomain = request.subdomain
      else 
        current_subdomain = nil
      end
      return current_subdomain
  end
  
  def check_my_subdomain(subdomain)
    if subdomain != current_subdomain
      redirect_to "/opps" , :alert => "Sorry, resource is not part of your subdomain"
    end
  end

end
