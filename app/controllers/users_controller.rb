class UsersController < ApplicationController
  
  def index
    @users = current_subdomain.nil? ? User.all : User.where(:subdomain_name => current_subdomain)
  end

  def show
    @user = User.find(params[:id])
    if !current_subdomain.nil?
      check_my_subdomain(@user.subdomain_name)
    end
  end

end
