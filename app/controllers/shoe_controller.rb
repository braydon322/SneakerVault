class ShoeController < ApplicationController
  get '/shoes' do
    if logged_in?
      @all_shoes = Shoe.all
      erb :'/shoes/shoes'
    else
      redirect to '/login'
    end
  end

  get '/shoes/new' do
    if logged_in?
      erb :'/shoes/add_shoe'
    else
      redirect to '/login'
    end
  end

  post '/shoes/new' do
    if logged_in? && params[:brand] != "" && params[:style_name] != "" && params[:size] != "" && params[:color] != ""
      @new_shoe = Shoe.create(params)
      @new_shoe.user_id = current_user.id
      @new_shoe.save
      redirect to '/shoes'
    else
      redirect to '/shoes/new'
    end
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
