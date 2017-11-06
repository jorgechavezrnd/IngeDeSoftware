require 'sinatra'
set :bind, '0.0.0.0'
set :port, 3000

get '/' do
  erb :index
end

get '/game' do
  @mensaje = "Te encuentras en la habitacion..."
  erb :game
end