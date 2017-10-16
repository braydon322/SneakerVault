class UserController < ApplicationController

  get '/signup' do
    erb :'/users/sign_up'
  end

  post '/signup' do
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
