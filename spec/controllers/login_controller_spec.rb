require 'spec_helper'

describe LoginController do

  # before :each do
  #   request.env['omniauth.auth'] = github_json
  #   get :create, :provider => 'github'
  # end

  it "should set a cookie with correct response from GitHub" do
    request.env['omniauth.auth'] = github_json
    get :create, :provider => 'github'

    expect(cookies[:uid]).to eq "1141717"
    # test that we send a post request with the right info to the api
    #Foofoberry.should_receive(:find_or_create_user).with("1141717").and_return("1 2 3 4 5")
    expect(cookies[:user_id]).to eq("12")
    # we should get a response with the user
    # then redirect to the dashboard
  end

  it "should create a user that doesn't exist" do 
    request.env['omniauth.auth'] = github_json 
    expect { get :create, :provider => 'github' }.to change { User.count }.by(1)

  end

  def github_json
    {"provider"=>"github", "uid"=>"1141717", "info"=>{"nickname"=>"thewatts", "email"=>nil, "name"=>"Nathaniel Watts", "image"=>"https://gravatar.com/avatar/c12d3710dada4fe5f9abfe4c783ff636?d=https%3A%2F%2Fidenticons.github.com%2Fb4b7be3ba425777d727562ad0e0057af.png&r=x", "urls"=>{"GitHub"=>"https://github.com/thewatts", "Blog"=>nil}}, "credentials"=>{"token"=>"cce3bcfe1d6f6c4f7be254313ff43a63d76007a5", "expires"=>false}, "extra"=>{"raw_info"=>{"login"=>"thewatts", "id"=>1141717, "avatar_url"=>"https://gravatar.com/avatar/c12d3710dada4fe5f9abfe4c783ff636?d=https%3A%2F%2Fidenticons.github.com%2Fb4b7be3ba425777d727562ad0e0057af.png&r=x", "gravatar_id"=>"c12d3710dada4fe5f9abfe4c783ff636", "url"=>"https://api.github.com/users/thewatts", "html_url"=>"https://github.com/thewatts", "followers_url"=>"https://api.github.com/users/thewatts/followers", "following_url"=>"https://api.github.com/users/thewatts/following{/other_user}", "gists_url"=>"https://api.github.com/users/thewatts/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/thewatts/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/thewatts/subscriptions", "organizations_url"=>"https://api.github.com/users/thewatts/orgs", "repos_url"=>"https://api.github.com/users/thewatts/repos", "events_url"=>"https://api.github.com/users/thewatts/events{/privacy}", "received_events_url"=>"https://api.github.com/users/thewatts/received_events", "type"=>"User", "site_admin"=>false, "name"=>"Nathaniel Watts", "company"=>"", "blog"=>nil, "location"=>nil, "email"=>nil, "hireable"=>false, "bio"=>nil, "public_repos"=>74, "public_gists"=>6, "followers"=>21, "following"=>23, "created_at"=>"2011-10-20T20:32:42Z", "updated_at"=>"2014-01-07T20:03:44Z"}}}
  end

end
