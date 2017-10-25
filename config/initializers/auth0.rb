Rails.application.config.middleware.use OmniAuth::Builder do
  provider(:auth0, ENV["AUTH0_API_KEY"], ENV["AUTH0_API_SECRET"], 'ntty.eu.auth0.com',
           callback_path: "/auth/auth0/callback")
end