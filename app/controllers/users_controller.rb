class UsersController < ApplicationController
  
  def index
    @users = current_subdomain.nil? ? User.all : current_subdomain.users
  end

  def show
    @user = User.find(params[:id])
    if !current_subdomain.nil?
      check_my_subdomain(@user.subdomain.name)
    end
  end

end
