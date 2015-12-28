if Rails.env.development?
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
end

OmniAuth.config.full_host = Rails.env.production? ? 'https://domain.com' : 'http://localhost.example.com'

# Rails.application.config.middleware.use OmniAuth::Builder do
#   # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
#   # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#
# end
