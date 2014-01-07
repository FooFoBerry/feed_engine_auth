require 'spec_helper'

describe LoginController do

  it "should have the json, yo" do
    get :create, :provider => 'github'
  end

  def github_json
    File.read('./spec/support/data/github_response.json')
  end

end
