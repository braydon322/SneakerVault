class UserController < ApplicationController

  get '/signup' do
    # if logged_in?
    #   # redirect to '/shoes'
    # else
      erb :'/users/sign_up'
    # end
  end

  post '/signup' do

    if params[:username] != "" && params[:password] != ""
     @new_user = User.new(:username => params[:username], :password => params[:password])
     @new_user.save
     session[:user_id] = @new_user.id
     redirect to '/shoes'
    else
     redirect to '/signup'
    end
  end

  get '/login' do
    erb :'/users/log_in'
  end

  post '/login' do
  end

  get '/logout' do
  end

  get '/users/:slug' do
  end

end
