require 'sinatra'
require './lib/cave'

$CAVE = Cave.new
$LOSE = false
$WIN = false

$MOVE = false
$SHOOT = false
$ACTION =true
$WRONGMOVE=false
$SHOOTFAIL= false
$EMPTYARROWS = false
$WUMPUSAROUND = false

get '/' do

  $CAVE = Cave.new
  $LOSE = false
  $WIN = false
  
  $MOVE = false
  $SHOOT = false
  $ACTION =true
  $WRONGMOVE=false
  $SHOOTFAIL= false
  $EMPTYARROWS = false
  $WUMPUSAROUND = false

  erb :index
end

get '/game' do

  if $CAVE.detectWumpus
    $WUMPUSAROUND = true
  end
  
  @youLose = $LOSE
  @move = $MOVE
  @shoot = $SHOOT
  @action = $ACTION
  @wrongMove = $WRONGMOVE
  @shootfail = $SHOOTFAIL
  @youWin = $WIN
  @arrowEmpty = $EMPTYARROWS
  @wumpusAround = $WUMPUSAROUND 

  $SHOOT = false
  $MOVE = false
  $ACTION = true
  $WRONGMOVE = false
  $SHOOTFAIL = false
  $EMPTYARROWS = false
  $WUMPUSAROUND = false

  @playerPosition = $CAVE.getPlayerPosition
  @numberArrow = $CAVE.getNumberArrow
  @messageArrowQuantity=$CAVE.showMessageEmptyArrow
  
  @messageAction=$CAVE.showMessageAction
  @messageMovementOption = $CAVE.showMessageMove
  @messageShootOption = $CAVE.showMessageShoot
  @messageNotMovement = $CAVE.showMessageNotMovement
  @messageShootFail = $CAVE.showMessageMissingArrow
  @messageWumpusAround = $CAVE.showMessageWumpusAround

  erb :game

end


post '/action' do

  if params[:accion] == 'salir'
    $CAVE = Cave.new
    redirect "/"
  elsif params[:accion] == 'disparar'
    if(!$CAVE.verifyArrows)
      if $CAVE.detectWumpus
        $WUMPUSAROUND = true
      end
      $SHOOT = true
      $MOVE = false
      $ACTION = false
    else
      if $CAVE.detectWumpus
        $WUMPUSAROUND = true
      end
      $MOVE = false
      $ACTION = true
      $EMPTYARROWS=true
    end
  elsif params[:accion] == 'moverse'
    if $CAVE.detectWumpus
      $WUMPUSAROUND = true
    end
    $MOVE = true
    $ACTION = false
    $SHOOT = false
  end
  redirect "/game"
end


post '/shot' do

  resultAction = $CAVE.shotArrow(params[:accion])

  if resultAction == false
    $SHOOTFAIL=true
    $ACTION= true
    $SHOOT= false
    $MOVE = false
  else
    $CAVE = Cave.new
    $WIN = true
  end

  redirect "/game"

end


post '/move' do
  resultAction = $CAVE.movePlayer(params[:accion])
  if $CAVE.verifyDeath == true
    $CAVE = Cave.new
    $LOSE = true
  else
    if resultAction == false
      $WRONGMOVE= true
    end
    if $CAVE.detectWumpus
      $WUMPUSAROUND = true
    end
    $ACTION= true
    $SHOOT= false
    $MOVE = false
  end
  redirect "/game"
end
