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
$GANAR = false
$FLECHAS = 3
$MENSAJEFLECHAS = "No tiene flechas que disparar"
$estadoflechas=false
$MOVERSE=false
$estadomoverse=false
get '/' do
  $CAVE = Cave.new
  $PERDER = false
  $GANAR = false
  $estadoflechas=false
  $MOVERSE=false
  $estadomoverse=false
  $estadoflechas=false
  $FLECHAS=3
  erb :index
end

get '/game' do
  @perdiste = $PERDER
  @disparo = $DISPARAR
  if($MOVERSE==false)
  if($MENSAJESTATE==true)
    @MensajeEstado = 'Que accion quieres realizar? 
      * Moverse
      * Lanzar flecha'
  else
    @MensajeEstado=""
  end 
end
  @moverse=$MOVERSE
  $DISPARAR = false
  $MOVERSE=false
  @cantFlechas = $FLECHAS
  @mensaje = $MENSAJE
  if(@cantFlechas<=0)
    @MensajeF=$MENSAJEFLECHAS
    $estadoflechas=true
  else
    @MensajeF=""
    $estadoflechas=true
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
    if($FLECHAS>0)
      $DISPARAR = true
      $MENSAJESTATE=false
      $estadomoverse=false
      $estadoflechas=false
      if($estadoflechas==false)
      $MENSAJE = "A donde desea disparar?
      * Norte
      * Sur
      * Este
      * Oeste"
      end
    else
      $estadomoverse=false
    end

    redirect "/game"
  else
    $MOVERSE=true
    $estadomoverse=true
    if($estadomoverse==true)
    $MENSAJE = "A donde desea moverse?
    * Norte
    * Sur
    * Este
    * Oeste"
    end
  end
  
  redirect "/game"
end
      
post '/shot' do
  $FLECHAS = $FLECHAS - 1
  if($FLECHAS>0)
  resultAction = $CAVE.shotArrow(params[:accion])
  if resultAction == 0
    if($CAVE.getPlayer.x != 0) then
      $MENSAJE = "La flecha se pierde de tu vista
      Te encuentras en la habitacion " + $CAVE.getPlayer.x.to_s + ($CAVE.getPlayer.y+1).to_s
    else
      $MENSAJE = "La flecha se pierde de tu vista
      Te encuentras en la habitacion " + ($CAVE.getPlayer.y+1).to_s
    end
    $MENSAJESTATE=true
    $estadomoverse=false
  end
  if resultAction == 1
    $CAVE = Cave.new
    $GANAR = true
    $estadomoverse=false
  end
else
  $MENSAJESTATE=true
  if($CAVE.getPlayer.x != 0) then
    $MENSAJE = "Te encuentras en la habitacion " + $CAVE.getPlayer.x.to_s + ($CAVE.getPlayer.y+1).to_s
  else
    $MENSAJE = "Te encuentras en la habitacion " + ($CAVE.getPlayer.y+1).to_s
  end
  end
  redirect "/game"
end

post '/move' do
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
  $MENSAJESTATE=true
  redirect "/game"
end