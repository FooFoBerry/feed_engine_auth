FeedEngineAuth::Application.routes.draw do
  root 'login#index'

  get '/auth/:provider/callback', to: 'login#create'
end
