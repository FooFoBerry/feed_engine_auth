Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, '24fb172060ed0abed1bb', '909c8386e21c199fcd79589f306ddb4d6d8e642f'
end

OmniAuth.config.full_host = "http://localhost:8080"
