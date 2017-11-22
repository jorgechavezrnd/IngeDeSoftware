require './lib/player'
require './lib/cave'
require './lib/room'
class Game

	def initialize
		@cave = Cave.new
		@wumpus = Player.new
		@arrow = Player.new
		@QuantityArrows = 0
		@player = Player.new
		@bats = Player.new
		@RemainingTurnsBats = 0
		@wumpusMove = false
		@QuantitySpray = 0
	end

	def getCave
		return @cave
	end

	def setCave(cave)
		@cave=cave
	end

	def getWumpus
		return @wumpus
	end

	def setWumpus(wumpus)
		wumpus=@wumpus
	end

	def getPlayer
		return @player
	end

	def setPlayer(player)
		@player=player
	end	

	def newDefaultGame(wumpusMove, typeOfMap)
		@player.setPlayerStatus
		@wumpus.setPlayerStatus
		@arrow.setPlayerStatus
		@bats.setPlayerStatus
		if(wumpusMove == true)
			@wumpusMove = wumpusMove
		end
		@RemainingTurnsBats = 10
		@QuantityArrows = 3
		@QuantitySpray = 1
		TypeOfDefaultMap(typeOfMap)
	end

	def TypeOfDefaultMap(typeOfMap)
		if(typeOfMap=='small') then
			@cave.createDefaultSmallMap
			initializePositionPlayersDefaultMap
		elsif (typeOfMap=='medium') then
			@cave.createDefaultMediumMap
			initializePositionPlayersDefaultMap
		elsif (typeOfMap=='big') then
			@cave.createDefaultBigMap
			initializePositionPlayersDefaultMap
		end				
	end

	def initializePositionPlayersDefaultMap
		@player.setPositionX(0)
		@player.setPositionY(0)
		@wumpus.setPositionX((@cave.getNumberCols-1))
		@wumpus.setPositionY((@cave.getNumberRows-1))
		@bats.setPositionX(0)
		@bats.setPositionY((@cave.getNumberRows-1))
		@cave.movePlayerToRoom(0,0)
		@cave.moveWumpusToRoom((@cave.getNumberCols-1),(@cave.getNumberRows-1))
		@cave.moveBatsToRoom(0,(@cave.getNumberRows-1))
	end

	def getRemainingTurnBats
		return @RemainingTurnsBats
	end

	def getQuantityArrows
		return @QuantityArrows
	end

	def decreaseArrowQuantity
		@QuantityArrows = @QuantityArrows - 1
	end

	def WumpusMove
		return @wumpusMove
	end

	def getQuantitySpray
		return @QuantitySpray
	end

	def resetReaminingTurnsBats
		@RemainingTurnsBats = 10
	end

	def dismissTurnsBats
		@RemainingTurnsBats = @RemainingTurnsBats - 1
	end

	def getBatsPosition
		return ((@cave.getNumberRows)*@bats.getPositionY) + (@bats.getPositionX+1) 
	end

	def getPlayerPosition
		return ((@cave.getNumberRows)*@player.getPositionY) + (@player.getPositionX+1) 
	end

	def getWumpusPosition
		return ((@cave.getNumberRows)*@wumpus.getPositionY) + (@wumpus.getPositionX+1) 
	end

	def getArrowPosition
		return ((@cave.getNumberRows)*@arrow.getPositionY) + (@arrow.getPositionX+1) 
	end

	def haveArrows
		return @QuantityArrows>0
  	end

  	def getNumberArrow
    	return @QuantityArrows.to_s
  	end

	def wumpusAlive
		return @wumpus.PlayerAlive
	end

	def CorrectMovement(player,direction)
		@room = @cave.getRoom(player.getPositionX,player.getPositionY)
		return @room.EntryOpen(direction)
	end

	def realizeMovement(player,direction)
		if (player == 'bats')
			@cave.moveBatsToRoom(@bats.getPositionX,@bats.getPositionY)
			@bats = movePlayerToDirection(@bats,direction)
			@cave.moveBatsToRoom(@bats.getPositionX,@bats.getPositionY)
		elsif (player == 'wumpus')
			@cave.moveWumpusToRoom(@wumpus.getPositionX,@wumpus.getPositionY)
			@wumpus = movePlayerToDirection(@wumpus,direction)
			@cave.moveBatsToRoom(@wumpus.getPositionX,@wumpus.getPositionY)
		elsif (player == 'player')
			@cave.movePlayerToRoom(@player.getPositionX,@player.getPositionY)
			@player = movePlayerToDirection(@player,direction)
			@cave.moveBatsToRoom(@player.getPositionX,@player.getPositionY)
		elsif (player == 'arrow')
			@cave.moveArrowToRoom(@arrow.getPositionX,@arrow.getPositionY)
			@arrow = movePlayerToDirection(@arrow,direction)
			@cave.moveArrowToRoom(@arrow.getPositionX,@arrow.getPositionY)
		end
	end

	def movePlayerToDirection(player,direction)
		if(direction == 'North')
			player.setPositionY(player.getPositionY-1)
		elsif (direction == 'South') 
			player.setPositionY(player.getPositionY+1)
		elsif (direction == 'West')
			player.setPositionX(player.getPositionX-1)
		elsif (direction == 'East')
			player.setPositionX(player.getPositionX+1)
		end
		return player
	end

	def DecideRandomDirection(number)
		if(@number==0)
			@direction='North'
		elsif (@randomDecision==1)
			@direction='South'
		elsif (@randomDecision==2)
			@direction='East'
		else
			@direction='West'
		end
		return @direction
	end

	def MoveBat
		if(@RemainingTurnsBats == 0 && @bats.PlayerAlive)
			@moveSuccessful=false
			while (@moveSuccessful==false) do
				@randomDecision=Random.new
				@randomDecision.rand(0..3)
				@direction=DecideRandomDirection(@randomDecision)
				if(CorrectMovement(@bats,@direction))
					realizeMovement('bats',@direction)
					@moveSuccessful = true
				end
			end
			resetReaminingTurnsBats
		end
	end

	def MoveWumpus
		if(@wumpus.PlayerAlive)
			@moveSuccessful=false
			while (@moveSuccessful==false) do
				@randomDecision=Random.new
				@randomDecision.rand(0..3)
				@direction=DecideRandomDirection(@randomDecision)
				if(CorrectMovement(@wumpus,@direction))
					realizeMovement('wumpus',@direction)
					@moveSuccessful = true
				end
			end
		end
	end

	def movePlayer(direction)
		if(CorrectMovement(@player,direction))
			realizeMovement('player',direction)
			return true
		else
			return false
		end
	end

  	def shotArrow(direction)
  		if(haveArrows==true)
  			@arrow.setPositionX(@player.getPositionX)
  			@arrow.setPositionY(@player.getPositionY)
  			decreaseArrowQuantity
			while(CorrectMovement(@arrow,direction)) do
				realizeMovement('arrow',direction)
				if (getWumpusPosition == getArrowPosition)
					return true
				end

			end
			return false
  		end
  		return false
  	end

	def detectWumpus
		return (((@player.getPositionX+1) == @wumpus.getPositionX)|| ((@player.getPositionX-1) == @wumpus.getPositionX) || ((@player.getPositionY+1)==@wumpus.getPositionY) || ((@player.getPositionY-1) == @wumpus.getPositionY))
  	end

  	def showMessageWumpusAround
	    return "
	    Hay un olor en el aire, el wumpus está cerca"
  	end

  	def showMessageMissingArrow
		return "
		La flecha se pierde de tu vista"
  	end

  	def showMessageMove
  		@message="
  		A donde desea moverse?" 
	    return getPossibleMovements(@message)
  	end

  	def showMessageShoot
  		@message="
  		A donde desea disparar?" 
    	return getPossibleMovements(@message)
  	end

  	def getPossibleMovements(message)
  		@room=@cave.getRoom(@player.getPositionX,@player.getPositionY)
  		if(@room.northOpen==true)
  			message=message+"
  			* Norte"
  		end
  		if(@room.southOpen)
  			message=message+"
  			* Sur"
  		end
  		if(@room.eastOpen)
  			message=message+"
  			* Este"
  		end
  		if(@room.westOpen)
  			message=message+"
  			* Oeste"
  		end
  		return message
  	end

  	def showMessageNotMovement
    	return "
    	No puedes moverte por ahi"
  	end

  	def showMessageEmptyArrow
    	return "
    	No tiene flechas que disparar"
  	end

  	def showMessageAction
	    return "
	    Que accion quieres realizar? 
	    * Moverse
	    * Lanzar flecha"
  	end

	def getPlayerPositionMessage
      return "
      Te encuentras en la habitacion " + getPlayerPosition.to_s
  	end

  	def YourLose
  		return getPlayerPosition==getWumpusPosition
  	end

end