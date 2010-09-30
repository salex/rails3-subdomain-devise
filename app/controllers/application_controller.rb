class ApplicationController < ActionController::Base
  include UrlHelper
  protect_from_forgery
  helper_method :current_subdomain, :check_my_subdomain
  before_filter :current_subdomain
  before_filter :set_mailer_url_options


  def current_subdomain
      if request.subdomains.first.present? && request.subdomains.first != "www"
        current_subdomain = Subdomain.find_by_name(request.subdomains.first)
      else 
        current_subdomain = nil
      end
      return current_subdomain
  end      
  
  def check_my_subdomain(subdomain)
    if subdomain != current_subdomain.name
      redirect_to "/opps" , :alert => "Sorry, resource is not part of your subdomain"
    end
  end

end
