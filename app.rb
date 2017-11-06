require 'sinatra'
require './lib/cave'
set :bind, '0.0.0.0'
set :port, 3000

$CAVE = Cave.new
$MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]"

get '/' do
  erb :index
end

get '/game' do
  @cantFlechas = 3
  @mensaje = $MENSAJE + '
Que accion quieres realizar?'
  erb :game
end

post '/action' do
  if params[:accion] == 'salir'
    $CAVE = Cave.new
    $MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]"
    redirect "/"
  elsif params[:accion] == 'disparar'
    redirect "/game"
  else
    if !$CAVE.movePlayer(params[:accion])
      $MENSAJE = "Movimiento no valido
Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]"
    else
      $MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]"
    end
  end
  
  redirect "/game"
end