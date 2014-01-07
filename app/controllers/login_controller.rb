class LoginController < ApplicationController

  def index
  end

  def create
    hash = auth_hash
    fail
  end

  def auth_hash
    request.env['omniauth.auth']
  end

end
