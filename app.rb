require 'sinatra'
require './lib/cave'
set :bind, '0.0.0.0'
set :port, 3000

$CAVE = Cave.new
if($CAVE.getPlayer.x != 0) then
  $MENSAJE = "Te encuentras en la habitacion " + $CAVE.getPlayer.x.to_s + ($CAVE.getPlayer.y+1).to_s
else
  $MENSAJE = "Te encuentras en la habitacion " + ($CAVE.getPlayer.y+1).to_s
end
$PERDER = false
$DETECT=false
$MENSAJESTATE=true


get '/' do
  erb :index
end

get '/game' do
  @perdiste = $PERDER
  @cantFlechas = 3
  @mensaje = $MENSAJE
  if($MENSAJESTATE==true)
    @MensajeEstado = 'Que accion quieres realizar? 
      * Moverse
      * Lanzar flecha'
  else
    @MensajeEstado=""
  end 
  erb :game
end

post '/action' do
  if params[:accion] == 'salir'
    $CAVE = Cave.new
    if($CAVE.getPlayer.x != 0) then
      $MENSAJE = "Te encuentras en la habitacion " + $CAVE.getPlayer.x.to_s + ($CAVE.getPlayer.y+1).to_s
    else
      $MENSAJE = "Te encuentras en la habitacion " + ($CAVE.getPlayer.y+1).to_s
    end
    if($CAVE.detectWumpus==true)
      $Detect=true
      @detect=$Detect
    else
      $Detect=false
      @detect=$Detect
    end
    redirect "/"
  elsif params[:accion] == 'disparar'
    $MENSAJESTATE=false
    $MENSAJE = "A donde desea disparar?
    * Norte
    * Sur
    * Este
    * Oeste"
    redirect "/game"
  else
    resultAction = $CAVE.movePlayer(params[:accion])
    if resultAction == 1
      $MENSAJE = "No puedes moverte por ahi\n"+
      if($CAVE.getPlayer.x != 0) then
        $MENSAJE = "Te encuentras en la habitacion " + $CAVE.getPlayer.x.to_s + ($CAVE.getPlayer.y+1).to_s
      else
        $MENSAJE = "Te encuentras en la habitacion " + ($CAVE.getPlayer.y+1).to_s
      end
      if($CAVE.detectWumpus == true)
        $Detect=true
        @detect=$Detect
      else
        $Detect==false
        @detect=$Detect
      end
    elsif resultAction == 2
      if($CAVE.getPlayer.x != 0) then
        $MENSAJE = "Te encuentras en la habitacion " + $CAVE.getPlayer.x.to_s + ($CAVE.getPlayer.y+1).to_s
      else
        $MENSAJE = "Te encuentras en la habitacion " + ($CAVE.getPlayer.y+1).to_s
      end
      if($CAVE.detectWumpus==true)
        $Detect=true
        @detect=$Detect
      else
        $Detect=false
        @detect=$Detect
      end
    elsif resultAction == 3
      $CAVE = Cave.new
      $PERDER = true
    end
  end
  
  redirect "/game"
end