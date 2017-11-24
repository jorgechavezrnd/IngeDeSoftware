require './lib/hunter'
require './lib/monster'
require './lib/cave'
require './lib/room'
class Game

	def initialize
		@cave = Cave.new
		@hunter = Hunter.new
		@hunter.takeArrow
		@hunter.takeArrow
		@hunter.takeArrow
		@hunter.takeSpray
		@arrow = Hunter.new
		@wumpus = Monster.new
		@bats = Monster.new
		@RemainingTurnsBats = 10
		@wumpusMove = false
		@sleepTurn = 1
	end

	def getCave
		return @cave
	end

	def getSleepTurn
		@bats.reviveMonster
		return @sleepTurn
	end

	def dismissSleepTurn
		@sleepTurn = 0
	end

	def resetSleepTurn
		@sleepTurn = 1
	end

	def setCave(cave)
		@cave=cave
	end

	def getArrow
		return @arrow
	end

	def setArrow(arrow)
		@arrow = arrow
	end

	def getWumpus
		return @wumpus
	end

	def setWumpus(wumpus)
		@wumpus = wumpus
	end

	def getHunter
		return @hunter
	end

	def setHunter(hunter)
		@hunter = hunter
	end	

	def getBats
		return @bats
	end

	def setBats(bats)
		@bats = bats
	end	

	def getQuantityOfRooms
		return @cave.getWidthCave*@cave.getHeightCave
	end

	def newDefaultGame(wumpusMove, typeOfMap)
		if(wumpusMove == true)
			@wumpusMove = true
		end
		@RemainingTurnsBats = 10
		@QuantityArrows = 3
		@QuantitySpray = 1
		typeOfDefaultMap(typeOfMap)
	end

	def typeOfDefaultMap(typeOfMap)
		if(typeOfMap=='small') then
			@cave.createCave(typeOfMap)
			initializePositionPlayersDefaultMap
		elsif (typeOfMap=='medium') then
			@cave.createCave(typeOfMap)
			initializePositionPlayersDefaultMap
		elsif (typeOfMap=='big') then
			@cave.createCave(typeOfMap)
			initializePositionPlayersDefaultMap
		end				
	end

	def initializePositionPlayersDefaultMap
		@hunter.setPositionX(0)
		@hunter.setPositionY(0)
		@wumpus.setPositionX((@cave.getWidthCave-1))
		@wumpus.setPositionY((@cave.getHeightCave-1))
		@bats.setPositionX(0)
		@bats.setPositionY((@cave.getHeightCave-1))
		@cave.movePlayerToRoom(@hunter.getPositionX,@hunter.getPositionY)
		@cave.moveWumpusToRoom(@wumpus.getPositionX,@wumpus.getPositionY)
		@cave.moveBatsToRoom(@bats.getPositionX,@bats.getPositionY)
	end

	def getRemainingTurnBats
		return @RemainingTurnsBats
	end

	def wumpusMove
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
		return ((@cave.getHeightCave)*@bats.getPositionY) + (@bats.getPositionX+1) 
	end

	def getArrowPosition
		return ((@cave.getHeightCave)*@arrow.getPositionY) + (@arrow.getPositionX+1) 
	end

	def getHunterPosition
		return ((@cave.getHeightCave)*@hunter.getPositionY) + (@hunter.getPositionX+1) 
	end

	def getWumpusPosition
		return ((@cave.getHeightCave)*@wumpus.getPositionY) + (@wumpus.getPositionX+1) 
	end

	def getRoomOfHunter(positionX,positionY)
		return @cave.getRoomOfCave(positionX,positionY)
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
  		@room=@cave.getRoomOfCave(@hunter.getPositionX,@hunter.getPositionY)
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

  	def showMessageBreeze
    	return "
    	Se siente una brisa en el aire"
  	end

  	def detectWaterWell
  		room = @cave.getRoomOfCave(@hunter.getPositionX,@hunter.getPositionY)
  		if(room.waterWellHere)
  			return true
  		end
  		return false
  	end

  	def detectBreeze
  		room = @cave.getRoomOfCave(@hunter.getPositionX,@hunter.getPositionY)
  		if(room.breezeHere)
  			return true
  		end
  		return false
  	end

  	def detectArrow
  		room = @cave.getRoomOfCave(@hunter.getPositionX,@hunter.getPositionY)
  		if(room.arrowHere)
  			@hunter.takeArrow
  			room.setArrowStay
  			@cave.setRoomOfCave(room,@hunter.getPositionX,@hunter.getPositionY)
  			return true
  		end
  		return false
  	end

  	def showMessageDetectArrow
  		return "
  Agarraste una flecha del cuarto"
  	end

  	def showMessageAction
	    return "
      Que accion quieres realizar? 
      * Moverse
      * Lanzar flecha"
  	end

	def getHunterPositionMessage
      return "
      Te encuentras en la habitacion " + getHunterPosition.to_s
  	end

	def decideRandomDirection(number)
		if(number==0)
			direction='North'
		elsif (number==1)
			direction='South'
		elsif (number==2)
			direction='East'
		elsif (number==3)
			direction='West'
		end
		return direction
	end

	def youDeath
  		return @hunter.hunterAlive
  	end

	def correctMovement(player,direction)
		room = @cave.getRoomOfCave(player.getPositionX,player.getPositionY)
		return room.entryOpen(direction)
	end

	def realizeMovement(player,direction)
		if (player == 'bats')
			@cave.moveBatsToRoom(@bats.getPositionX,@bats.getPositionY)
			setBats(movePlayerToDirection(@bats,direction))
			@cave.moveBatsToRoom(@bats.getPositionX,@bats.getPositionY)
		elsif (player == 'wumpus')
			@cave.moveWumpusToRoom(@wumpus.getPositionX,@wumpus.getPositionY)
			setWumpus(movePlayerToDirection(@wumpus,direction))
			@cave.moveWumpusToRoom(@wumpus.getPositionX,@wumpus.getPositionY)
		elsif (player == 'hunter')
			@cave.movePlayerToRoom(@hunter.getPositionX,@hunter.getPositionY)
			setHunter(movePlayerToDirection(@hunter,direction))
			@cave.movePlayerToRoom(@hunter.getPositionX,@hunter.getPositionY)
		elsif (player == 'arrow')
			@cave.moveArrowToRoom(@arrow.getPositionX,@arrow.getPositionY)
			setArrow(movePlayerToDirection(@arrow,direction))
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

	def moveHunter(direction)
		if(@wumpusMove==true)
			moveWumpus
		end
		if(getWumpusPosition==getHunterPosition)
			@hunter.killHunter
		end
		if(correctMovement(@hunter,direction))
			realizeMovement('hunter',direction)
			if(getWumpusPosition == getHunterPosition)
				@hunter.killHunter
			end
			dismissTurnsBats
			return true
		else
			if(getWumpusPosition==getHunterPosition)
				@hunter.killHunter
			end
			dismissTurnsBats
			return false
		end
	end

	def moveBat
		moveSuccessful = false
		if(@sleepTurn==1)
			if(@RemainingTurnsBats == 0)
				while (!moveSuccessful) do
					randomDecision = Random.new
					randomDecision = randomDecision.rand(0..3)
					direction = decideRandomDirection(randomDecision)
					if(correctMovement(@bats,direction))
						realizeMovement('bats',direction)
						moveSuccessful = true
					end
				end
				resetReaminingTurnsBats
			end
		else
			resetSleepTurn
		end
	end

	def batsStatus
		return @bats.monsterAlive
	end

	def moveWumpus
		moveSuccessful = false
		while (!moveSuccessful) do
			randomDecision = Random.new
			randomDecision = randomDecision.rand(0..3)
			direction = decideRandomDirection(randomDecision)
			if(correctMovement(@wumpus,direction))
				realizeMovement('wumpus',direction)
				moveSuccessful = true
			end
		end
	end

  	def shotArrow(direction)
  		if(@hunter.haveArrows==true)
  			@arrow.setPositionX(@hunter.getPositionX)
  			@arrow.setPositionY(@hunter.getPositionY)
  			room = @cave.getRoomOfCave(@hunter.getPositionX,@hunter.getPositionY)
  			room.setArrowStay
  			@hunter.dropArrow
			while(correctMovement(@arrow,direction)) do
				realizeMovement('arrow',direction)
				if (getWumpusPosition == getArrowPosition)
					@hunter.setMoney(@hunter.getQuantityOfMoney+100)
					return true
				end
			end
			dismissTurnsBats
			return false
  		end
  		dismissTurnsBats
  		return false
  	end

  	def detectWumpus(direction)
  		if(direction == 'South' && correctMovement(@hunter,'South'))
  			return ((@hunter.getPositionY+1)==@wumpus.getPositionY && @hunter.getPositionX==@wumpus.getPositionX)
  		end
  		if(direction == 'North' && correctMovement(@hunter,'North'))
  			return ((@hunter.getPositionY-1)==@wumpus.getPositionY && @hunter.getPositionX==@wumpus.getPositionX)
  		end
  		if(direction == 'East' && correctMovement(@hunter,'East'))
  			return ((@hunter.getPositionX+1)==@wumpus.getPositionX && @hunter.getPositionY==@wumpus.getPositionY)
  		end
  		if(direction == 'West' && correctMovement(@hunter,'West'))
  			return ((@hunter.getPositionX-1)==@wumpus.getPositionX && @hunter.getPositionY==@wumpus.getPositionY)
  		end
  		return false
  	end

  	def detectBats
  		room = @cave.getRoomOfCave(@hunter.getPositionX,@hunter.getPositionY)
  		if(room.batsHere)
  			return true
  		end
  		return false
  	end

  	def useSpray
  		if(@hunter.haveSpray)
  			@hunter.useSpray
  			@bats.killMonster
  			@dismissSleepTurn
  			@hunter.setMoney(@hunter.getQuantityOfMoney+30)
  			return true
  		end
  		return false
  	end

  	def useSprayMessage
  		return"
  Usaste el spray que tenias. Los murciélagos quedaron dormidos"
  	end

  	def randomMovementByBatsMessage
  		return"
  	Te llevaron a la habitacion "+ getHunterPosition.to_s
  	end

  	def detectBatsMessage
  		return"
  	Cuidado! Te encontraste con murciélagos"
  	end

  	def moveRandomByBats
  		randomDecision = getHunterPosition
		while(getWumpusPosition==randomDecision || getHunterPosition==randomDecision) do
			randomDecision = Random.new
			randomDecision = randomDecision.rand(0..getQuantityOfRooms)
		end
  		(0..@cave.getWidthCave-1).each do |i|
   			(0..@cave.getHeightCave-1).each do |j|
   				if(randomDecision==(((@cave.getHeightCave)*j) + (i+1)))
   					@hunter.setPositionX(i)
   					@hunter.setPositionY(j)
   				end
			end
		end
  	end 
end