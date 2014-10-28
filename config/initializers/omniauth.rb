Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Figaro.env.omniauth_twitter_key, Figaro.env.omniauth_twitter_secret
end