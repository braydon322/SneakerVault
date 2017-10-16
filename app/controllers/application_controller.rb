require './config/environment'
require 'pry'
require 'omniauth-twitter'

use OmniAuth::Builder do
provider :twitter, '1OwSoXpZkgSdKfMC1o4SWAPq5', '	Nf5o4mzvxnXjCzhoKjQ9lpG4TlX00v9t25mp5qsRW2KaZZECKh'
end


class ApplicationController < Sinatra::Base


  configure do
   set :public_folder, 'public'
   set :views, 'app/views'
   enable :sessions
   set :session_secret, "password_security"
  end

  get '/' do
    erb :index
  end

  helpers do
    def logged_in?
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end
  end
end
