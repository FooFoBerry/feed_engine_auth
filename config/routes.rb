FeedEngineAuth::Application.routes.draw do
  root 'login#index'

  get '/auth/:provider/callback', to: 'login#create'

  get '/dashboard', :to => redirect('http://162.243.206.48/dashboard'), :as => 'dashboard'
end
