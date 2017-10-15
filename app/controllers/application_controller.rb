require './config/environment'
require 'pry'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end
end
