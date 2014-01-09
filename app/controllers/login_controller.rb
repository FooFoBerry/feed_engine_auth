class LoginController < ApplicationController

  respond_to :json, :only => :create

  def index
  end

  def create
    hash = auth_hash
    user = User.find_or_create_by(:uid => hash["uid"])
    cookies[:uid] = hash["uid"]
    cookies[:user_id] = user.id
    redirect_to dashboard_path
  end

  def auth_hash
    request.env['omniauth.auth']
  end

  def post(param)

  end

end

class Foofoberry
  #this will be the gem  
  def self.find_or_create_user(user_data)
    "12"
    #this will be a post method of some sort
  end   
end


