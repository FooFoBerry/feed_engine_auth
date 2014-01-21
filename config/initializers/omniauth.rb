Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  if Rails.env.production?
    provider :github, '24fb172060ed0abed1bb', '909c8386e21c199fcd79589f306ddb4d6d8e642f'
  else
    provider :github, 'b38f5e35c8e5af8ec3e2', '8fcb53f99a91fe0e1ef7c910ea92d51d20be6fff'
  end
end

OmniAuth.config.full_host = Rails.env.production? ? "http://162.243.206.48" : "http://localhost:8080"
