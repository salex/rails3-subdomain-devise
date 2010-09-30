class HomeController < ApplicationController
  def index
    if current_user
      subdomain = current_user.subdomain.name
      sign_out(current_user)
      redirect_to new_user_session_url( :subdomain => subdomain), :notice => "Please sign-in to your subdomain account"
    end
  end

end
