OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['1443356749229076'], ENV['372c1e1ec4fd9a9236f2b0d3b790ef2e']
end