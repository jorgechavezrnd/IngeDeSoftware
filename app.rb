require 'sinatra'
require './lib/cave'
set :bind, '0.0.0.0'
set :port, 3000

$CAVE = Cave.new
$MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]" + "\n" + $CAVE.getRooms.to_s
$PERDER = false

get '/' do
  $PERDER = false
  $MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]" + "\n" + $CAVE.getRooms.to_s
  erb :index
end

get '/game' do
  @perdiste = $PERDER
  @cantFlechas = 3
  @mensaje = $MENSAJE + '
Que accion quieres realizar?'
  erb :game
end

post '/action' do
  if params[:accion] == 'salir'
    $CAVE = Cave.new
    $MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]" + "\n" + $CAVE.getRooms.to_s
    redirect "/"
  elsif params[:accion] == 'disparar'
    redirect "/game"
  else
    resultAction = $CAVE.movePlayer(params[:accion])
    if resultAction == 1
      $MENSAJE = "No puedes moverte por ahi
Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]" + "\n" + $CAVE.getRooms.to_s
    elsif resultAction == 2
      $MENSAJE = "Te encuentras en la habitacion [" + $CAVE.getPlayer.x.to_s + "][" + $CAVE.getPlayer.y.to_s + "]" + "\n" + $CAVE.getRooms.to_s
    elsif resultAction == 3
      $CAVE = Cave.new
      $PERDER = true
    end
  end
  
  redirect "/game"
end