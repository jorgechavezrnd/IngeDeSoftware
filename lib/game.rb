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

	def getRemainingTurnBats
		return @RemainingTurnsBats
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

	def getQuantityArrows
		return @QuantityArrows
	end

	def decreaseArrowQuantity
		if(@QuantityArrows > 0) then
			@QuantityArrows = @QuantityArrows - 1
		end
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

	def getPlayerPosition
		return ((@cave.getNumberRows)*@player.getPositionY) + (@player.getPositionX+1) 
	end

	def getWumpusPosition
		return ((@cave.getNumberRows)*@wumpus.getPositionY) + (@wumpus.getPositionX+1) 
	end

	def realizeMovement(oldPositionX,oldPositionY,newPositionX,newPositionY)
		@cave.movePlayerToRoom(oldPositionX,oldPositionY)
		@cave.movePlayerToRoom(newPositionX,newPositionY)
	end

	def MoveBat
		if(@RemainingTurnsBats == 0 && @bats.PlayerAlive)
			@moveSuccessful=false
			while (@moveSuccessful==false) do
				@randomDecision=Random.new
				@randomDecision.rand(0..3)
				if(@randomDecision == 0)
					if(CorrectMovement('North',@bats.getPositionX,@bats.getPositionY))
						realizeMovement(@bats.getPositionX,@bats.getPositionY,@bats.getPositionX+1,@bats.getPositionY)
						@bats.setPositionX(@bats.getPositionX+1)
						@moveSuccessful = true
					end
				elsif (@randomDecision == 1)
					if(CorrectMovement('South',@bats.getPositionX,@bats.getPositionY))
						realizeMovement(@bats.getPositionX,@bats.getPositionY,@bats.getPositionX-1,@bats.getPositionY)
						@bats.setPositionX(@bats.getPositionX-1)
						@moveSuccessful = true
					end
				elsif (@randomDecision == 2)
					if(CorrectMovement('East',@bats.getPositionX,@bats.getPositionY))
						realizeMovement(@bats.getPositionX,@bats.getPositionY,@bats.getPositionX,@bats.getPositionY+1)
						@bats.setPositionY(@bats.getPositionY+1)
						@moveSuccessful = true
					end
				else
					if(CorrectMovement('West',@bats.getPositionX,@bats.getPositionY))
						realizeMovement(@bats.getPositionX,@bats.getPositionY,@bats.getPositionX,@bats.getPositionY-1)
						@bats.setPositionY(@bats.getPositionY-1)
						@moveSuccessful = true
					end
				end
			end
			@RemainingTurnsBats = 10
		end
	end

	def CorrectMovement(direction,positionX,positionY)
		@room = @cave.getRoom(positionX,positionY)
		return @room.EntryOpen(direction)
	end

	def MoveWumpus
		if(@wumpus.PlayerAlive)
			@moveSuccessful=false
			while (@moveSuccessful==false) do
				@randomDecision=Random.new
				@randomDecision.rand(0..3)
				if(@randomDecision == 0)
					if(CorrectMovement('North',@wumpus.getPositionX,@wumpus.getPositionY))
						realizeMovement(@wumpus.getPositionX,@wumpus.getPositionY,@wumpus.getPositionX+1,@wumpus.getPositionY)
						@wumpus.setPositionX(@wumpus.getPositionX+1)
						@moveSuccessful = true
					end
				elsif (@randomDecision == 1)
					if(CorrectMovement('South',@wumpus.getPositionX,@wumpus.getPositionY))
						realizeMovement(@wumpus.getPositionX,@wumpus.getPositionY,@wumpus.getPositionX-1,@wumpus.getPositionY)
						@wumpus.setPositionX(@wumpus.getPositionX-1)
						@moveSuccessful = true
					end
				elsif (@randomDecision == 2)
					if(CorrectMovement('East',@wumpus.getPositionX,@wumpus.getPositionY))
						realizeMovement(@wumpus.getPositionX,@wumpus.getPositionY,@wumpus.getPositionX,@wumpus.getPositionY+1)
						@wumpus.setPositionY(@wumpus.getPositionY+1)
						@moveSuccessful = true
					end
				else
					if(CorrectMovement('West',@wumpus.getPositionX,@wumpus.getPositionY))
						realizeMovement(@wumpus.getPositionX,@wumpus.getPositionY,@wumpus.getPositionX,@wumpus.getPositionY-1)
						@wumpus.setPositionY(@wumpus.getPositionY-1)
						@moveSuccessful = true
					end
				end
			end
		end
	end

	def gameOver
		return (@player.getPositionX==@wumpus.getPositionX && @player.getPositionY==@wumpus.getPositionY)
	end

	def gameWin
		return @wumpus.PlayerAlive
	end

	def movePlayer(direction)
		if direction == 'norte'
			if(CorrectMovement('North',@player.getPositionX,@player.getPositionY))
				realizeMovement(@player.getPositionX,@player.getPositionY,@player.getPositionX,@player.getPositionY-1)
				@player.setPositionY(@player.getPositionY-1)
			else
				return false
			end
		elsif direction == 'sur'
			if(CorrectMovement('South',@player.getPositionX,@player.getPositionY))
				realizeMovement(@player.getPositionX,@player.getPositionY,@player.getPositionX,@player.getPositionY+1)
				@player.setPositionY(@player.getPositionY+1)
			else
				return false
			end
		elsif direction == 'oeste'
			if(CorrectMovement('West',@player.getPositionX,@player.getPositionY))
				realizeMovement(@player.getPositionX,@player.getPositionY,@player.getPositionX-1,@player.getPositionY)
				@player.setPositionX(@player.getPositionX-1)
			else
				return false
			end
		elsif direction == 'este' 
			if(CorrectMovement('East',@player.getPositionX,@player.getPositionY))
				realizeMovement(@player.getPositionX,@player.getPositionY,@player.getPositionX+1,@player.getPositionY)
				@player.setPositionX(@player.getPositionX+1)
			else
				return false
			end
		else 
			return false
		end
		return true
	end

	def detectWumpus
    	return ( ((@player.getPositionX+1)==@wumpus.getPositionX)|| ((@player.getPositionX-1)==@wumpus.getPositionX) || ((@player.getPositionY+1)==@wumpus.getPositionY) || ((@player.getPositionY-1)==@wumpus.getPositionY) )
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

  	def getPossibleMovements(message)
  		@room=@cave.getRoom(@player.getPositionX,@player.getPositionY)
  		if(@room.northOpen==true)
  			message=message+"
  			* Norte"
  		end
  		if(@room.southOpen==true)
  			message=message+"
  			* Sur"
  		end
  		if(@room.eastOpen==true)
  			message=message+"
  			* Este"
  		end
  		if(@room.westOpen==true)
  			message=message+"
  			* Oeste"
  		end
  		return message
  	end

  	def showMessageShoot
  		@message="
  		A donde desea disparar?" 
    	return getPossibleMovements(@message)
  	end

  	def showMessageNotMovement
    	return "
    	No puedes moverte por ahi"
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

  	def haveArrows
		return @QuantityArrows>0
  	end

  	def getNumberArrow
    	return @QuantityArrows.to_s
  	end

  	def getPlayerPositionMessage
      return "
    	Te encuentras en la habitacion " + getPlayerPosition.to_s
  	end

end


=begin

  def shotArrow(address)

    @arrow  = Player.new
    @arrow.x = @player.x
    @arrow.y = @player.y
    if(@numberArrows>0)
      reduceArrows
    end
    if address == 'arriba'
      while @arrow.x >= 0 do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.x = @arrow.x - 1
      end
    end
    if address == 'abajo'
      while @arrow.x < $NUMBER_ROWS do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.x = @arrow.x + 1
      end
    end
    if address == 'izquierda'
      while @arrow.y >= 0 do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.y = @arrow.y - 1
      end
    end
    if address == 'derecha'
      while @arrow.y < $NUMBER_COLUMNS do
        if @arrow.x == @wumpus.x && @arrow.y == @wumpus.y
          return true
        end
        @arrow.y = @arrow.y + 1
      end
    end
    return false
  end

end
=end