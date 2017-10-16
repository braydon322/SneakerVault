class ShoeController < ApplicationController
  get '/shoes' do
    erb :'/shoes/shoes'
  end

  get '/shoes/new' do
  end

  post '/shoes/new' do
  end

  get '/shoes/:id' do
  end

  get '/shoes/:id/edit' do
  end

  patch '/shoes/:id' do
  end

  delete '/shoes/:id/delete' do
  end
end
