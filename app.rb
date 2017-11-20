require 'sinatra'
require './lib/game'

$GAME = Game.new
$GAME.newDefaultGame(true, 'small')
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

  $GAME = Game.new
  $GAME.newDefaultGame(true, 'small')
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

  if $GAME.detectWumpus
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

  @playerPosition = $GAME.getPlayerPositionMessage
  @numberArrow = $GAME.getNumberArrow
  @messageArrowQuantity=$GAME.showMessageEmptyArrow
  
  @messageAction=$GAME.showMessageAction
  @messageMovementOption = $GAME.showMessageMove
  @messageShootOption = $GAME.showMessageShoot
  @messageNotMovement = $GAME.showMessageNotMovement
  @messageShootFail = $GAME.showMessageMissingArrow
  @messageWumpusAround = $GAME.showMessageWumpusAround

  erb :game

end


post '/action' do

  if params[:accion] == 'salir'
    $GAME = Game.new
    $GAME.newDefaultGame(true, 'small')
    redirect "/"
  elsif params[:accion] == 'disparar'
    if($GAME.haveArrows)
      if $GAME.detectWumpus
        $WUMPUSAROUND = true
      end
      $SHOOT = true
      $MOVE = false
      $ACTION = false
    else
      if $GAME.detectWumpus
        $WUMPUSAROUND = true
      end
      $MOVE = false
      $ACTION = true
      $EMPTYARROWS=true
    end
  elsif params[:accion] == 'moverse'
    if $GAME.detectWumpus
      $WUMPUSAROUND = true
    end
    $MOVE = true
    $ACTION = false
    $SHOOT = false
  end
  redirect "/game"
end


post '/shot' do
=begin
  resultAction = $CAVE.shotArrow(params[:accion])

  if resultAction == false
    $SHOOTFAIL=true
    $ACTION= true
    $SHOOT= false
    $MOVE = false
  else
    $GAME = Game.new
    $WIN = true
  end
=end
  redirect "/game"

end


post '/move' do
  resultAction = $GAME.movePlayer(params[:accion])
  if $GAME. == true
    $GAME = Game.new
    $GAME.newDefaultGame(true, 'small')
    $LOSE = true
  else
    if resultAction == false
      $WRONGMOVE= true
    end
    if $GAME.detectWumpus
      $WUMPUSAROUND = true
    end
    $ACTION= true
    $SHOOT= false
    $MOVE = false
  end
  redirect "/game"
end