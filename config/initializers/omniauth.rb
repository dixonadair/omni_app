Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, '76UNWsxGSYN98tOb3lKX7AFUW', 'Y6tKEOIZ4iJTzaicvq5lGhH4dLs1GOhTF1YbOyFFSBSlbtz2Mk'
  provider :facebook, '1686009574951373', 'a6d4882dca8dda57471ab842200c8af4'
  provider :github, '2e6298ecfe581282b1b8', '2f9aa28336eca4830229b4c7de6e62a2d4bfe1e4'
  # provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
end