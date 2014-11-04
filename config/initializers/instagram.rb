require 'instagram'

  Rails.application.config.instagram =  
    Instagram.configure do |config|
      config.client_id = Figaro.env.insta_id
      config.client_secret = Figaro.env.insta_secret
    end

