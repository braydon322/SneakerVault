class ShoeController < ApplicationController
  get '/shoes' do
    ReleaseScraper.scrape_release
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
      @shoe_slug = "#{@new_shoe.brand} #{@new_shoe.style_name} #{@new_shoe.color}".downcase.gsub(' ','+')
      url = "https://www.google.com/search?biw=1680&bih=976&tbm=isch&sa=1&q=" + @shoe_slug + "&oq=" + @shoe_slug + "&gs_l=psy-ab.3..0l10.4067.7152.0.7267.19.19.0.0.0.0.120.1489.17j2.19.0....0...1.1.64.psy-ab..0.19.1488...0i67k1.0.J04MymRcUzg"
      ReleaseScraper.scrape_shoe(url)
      @url = ReleaseScraper.url
      @new_shoe.url = @url
      @new_shoe.user_id = current_user.id
      @new_shoe.save
      redirect to '/shoes'
    else
      redirect to '/shoes/new'
    end
  end

  get '/shoes/:id' do
    @shoe = Shoe.find(params[:id])
    erb :'/shoes/individual_shoe'
  end

  get '/shoes/:id/edit' do
    @shoe = Shoe.find(params[:id])
    erb :'/shoes/edit_shoe'
  end

  patch '/shoes/:id' do
    @shoe = Shoe.find(params[:id])
    if params[:brand] != "" && params[:style_name] != "" &&  params[:size] != "" &&  params[:color] != ""
      @shoe.update(:brand => params[:brand], :style_name => params[:style_name], :size => params[:size], :color => params[:color])
    end
    @shoe_slug = "#{@shoe.brand} #{@shoe.style_name} #{@shoe.color}".downcase.gsub(' ','+')
    url = "https://www.google.com/search?biw=1680&bih=976&tbm=isch&sa=1&q=" + @shoe_slug + "&oq=" + @shoe_slug + "&gs_l=psy-ab.3..0l10.4067.7152.0.7267.19.19.0.0.0.0.120.1489.17j2.19.0....0...1.1.64.psy-ab..0.19.1488...0i67k1.0.J04MymRcUzg"
    ReleaseScraper.scrape_shoe(url)
    @url = ReleaseScraper.url
    @shoe.url = @url
    @shoe.user_id = current_user.id
    @shoe.save
    redirect to "/shoes/#{@shoe.id}"
  end

  get '/shoes/:id/delete' do
    @shoe = Shoe.find(params[:id])
    @shoe.delete
  end
end
