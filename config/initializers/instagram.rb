require 'instagram'

  Rails.application.config.instagram =  
    Instagram.configure do |config|
      config.client_id = ENV['INSTA_ID']
      config.client_secret = ENV['INSTA_SECRET']
    end

