FeedEngineAuth::Application.routes.draw do
  root 'login#index'

  get '/auth/:provider/callback', to: 'login#create'

  get '/dashboard', :to => redirect('localhost:3001/dashboard'), :as => 'dashboard'
end
