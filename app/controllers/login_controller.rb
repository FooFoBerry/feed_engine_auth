class LoginController < ApplicationController

  respond_to :json, :only => :create

  def index
  end

  def create
    user = User.find_or_create_by(:uid => auth_hash["uid"]) if auth_hash
    if user
      cookies.signed[:uid]     = user.uid
      cookies.signed[:user_id] = user.id
      cookies[:flash]   = "Successfully Signed In!"
      redirect_to dashboard_path
    else
      flash[:notice] = "Sorry, something went wrong."
      redirect_to root_path
    end
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end


