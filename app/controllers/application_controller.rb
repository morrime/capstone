class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  #
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def client
    @client ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      config.access_token = session[:access_token]
      config.access_token_secret = session[:access_token_secret]
    end
  end

end
