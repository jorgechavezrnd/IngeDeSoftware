require 'sinatra'
require './lib/game'
set :bind, '0.0.0.0'
set :port, 3000

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
$SLEEP = false
$WATERWELL = false
$DETECTARROW = false
$DETECTBREEZE = false
$DETECTBATS = false
$USESPRAY = false
$MOVERANDOM = false

get '/' do
  erb :index
end

get '/views/index.css' do
  return index.css
end

get '/options' do
  erb :options
end

post '/start' do
  if(params[:map]=='small')
    map = 'small'
  else
    map = 'medium'
  end
  if(params[:move]=='no')
    move = false
  else
    move = true
  end
  $GAME = Game.new
  $GAME.newDefaultGame(move, map)
  $LOSE = false
  $WIN = false
  $MOVE = false
  $SHOOT = false
  $ACTION =true
  $WRONGMOVE=false
  $SHOOTFAIL= false
  $EMPTYARROWS = false
  $WUMPUSAROUND = false
  $SLEEP = false
  $WATERWELL = false
  $DETECTARROW = false
  $DETECTBREEZE = false
  $DETECTBATS = false
  $USESPRAY = false
  $MOVERANDOM = false
  redirect "/game"
end

get '/game' do
  if $GAME.detectWumpus('South') || $GAME.detectWumpus('North') ||$GAME.detectWumpus('East') || $GAME.detectWumpus('West')
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
  @sleep = $SLEEP
  @waterWell=$WATERWELL
  @detectArrow=$DETECTARROW
  @detectBreeze=$DETECTBREEZE
  @useSpray=$USESPRAY
  @detectBats=$DETECTBATS
  @moveRandom=$MOVERANDOM
  $SHOOT = false
  $MOVE = false
  $ACTION = true
  $WRONGMOVE = false
  $SHOOTFAIL = false
  $EMPTYARROWS = false
  $WUMPUSAROUND = false
  $SLEEP = false
  $WATERWELL = false
  $DETECTARROW = false
  $DETECTBREEZE = false
  $DETECTBATS = false
  $USESPRAY = false
  $MOVERANDOM = false
  @playerPosition = $GAME.getHunterPositionMessage
  hunter = $GAME.getHunter
  @numberArrow = hunter.getQuantityArrows
  @randomMovementByBatsMessage = $GAME.randomMovementByBatsMessage
  @useSprayMessage = $GAME.useSprayMessage
  @detectBatsMessage = $GAME.detectBatsMessage
  @numberSpray = hunter.getQuantitySpray
  @money = hunter.getQuantityOfMoney
  @messageBreeze = $GAME.showMessageBreeze
  @detectArrowMessage = $GAME.showMessageDetectArrow
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
  if $GAME.detectWumpus('South') || $GAME.detectWumpus('North') ||$GAME.detectWumpus('East') || $GAME.detectWumpus('West')
    $WUMPUSAROUND = true
  end
  if params[:accion] == 'salir'
    $GAME = Game.new
    $GAME.newDefaultGame(true, 'small')
    redirect "/"
  elsif params[:accion] == 'disparar'
    hunter = $GAME.getHunter
    if(hunter.haveArrows)
      $SHOOT = true
      $MOVE = false
      $ACTION = false
    else
      $MOVE = false
      $ACTION = true
      $EMPTYARROWS = true
    end
  elsif params[:accion] == 'moverse'
    $MOVE = true
    $ACTION = false
    $SHOOT = false
  end
  redirect "/game"
end


post '/shot' do
  resultAction = $GAME.shotArrow(params[:direccion])
  if resultAction == false
    $SHOOTFAIL=true
    $ACTION= true
    $SHOOT= false
    $MOVE = false
  else
    $WIN = true
  end
  redirect "/game"

end


post '/move' do
  $GAME.moveBat
  resultAction = $GAME.moveHunter(params[:direccion])
  if($GAME.detectArrow)
    $DETECTARROW = true
  end
  if($GAME.detectWaterWell)
    $WATERWELL = true
  end
  if($GAME.detectBats)
    $DETECTBATS = true
    if($GAME.useSpray)
      $USESPRAY = true
    else
      $GAME.moveRandomByBats
      $MOVERANDOM = true
    end
  end
  if($GAME.detectBreeze)
    $DETECTBREEZE = true
  end
  if $GAME.youDeath == false
    $GAME = Game.new
    $GAME.newDefaultGame(true, 'small')
    $LOSE = true
  else
    if resultAction == false
      $WRONGMOVE= true
    end
    if $GAME.detectWumpus('South') || $GAME.detectWumpus('North') ||$GAME.detectWumpus('East') || $GAME.detectWumpus('West')
      $WUMPUSAROUND = true
    end
    $ACTION= true
    $SHOOT= false
    $MOVE = false
  end
  if $GAME.batsStatus == false
    $SLEEP = true
  end
  redirect "/game"
end