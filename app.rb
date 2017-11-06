require 'sinatra'
set :bind, '0.0.0.0'
set :port, 3000

$MENSAJE = "Te encuentras en la habitacion..."

get '/' do
  erb :index
end

get '/game' do
  @cantFlechas = 3
  @mensaje = $MENSAJE
  erb :game
end

post '/action' do
  if params[:accion] == 'arriba'
    $MENSAJE = "arriba"
  elsif params[:accion] == 'abajo'
    $MENSAJE = "abajo"
  elsif params[:accion] == 'izquierda'
    $MENSAJE = "izquierda"
  elsif params[:accion] == 'derecha'
    $MENSAJE = "derecha"
  elsif params[:accion] == 'disparar'
    $MENSAJE = "lanzar flecha"
  else
    $MENSAJE = "Te encuentras en la habitacion..."
    redirect "/"
  end
  
  redirect "/game"
end