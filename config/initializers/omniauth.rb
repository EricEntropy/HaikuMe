Rails.application.config.middleware.use OmniAuth::Builder do
    provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
end 
#    provider :github, ENV['0d1099df3bba4f46c45f'], ENV['1a5b124313bc0504859f961154bc0bed874352df']
