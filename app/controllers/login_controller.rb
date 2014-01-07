class LoginController < ApplicationController

  respond_to :json, :only => :create

  def index
  end

  def create
    hash = auth_hash
    session[:uid] = hash["uid"]
    redirect_to dashboard_path
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
