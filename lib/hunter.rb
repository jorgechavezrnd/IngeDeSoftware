require './lib/player'
class Hunter < Player

	def initialize
		super
		@arrows = 0
		@spray = 0
		@money = 0
	end

	def hunterAlive
		return self.playerAlive
	end

	def getQuantityArrows
		return @arrows
	end

	def getQuantitySpray
		return @spray
	end

	def getQuantityOfMoney
		return @money
	end

	def setMoney(money)
		@money = money
	end

	def takeArrow
		@arrows = @arrows + 1
	end

	def dropArrow
		@arrows = @arrows - 1
	end

	def takeSpray 
		@spray = @spray + 1
	end

	def useSpray
		@spray = @spray - 1
	end

	def haveArrows
		return @arrows>0
	end

	def haveSpray
		return @spray>0
	end

	def getHunterPositionX
		return self.getPositionX
	end

	def getHunterPositionY
		return self.getPositionY
	end

	def killHunter
		return self.setPlayerStatus
	end

	def setHunterPositionX(positionX)
		return self.setPositionX(positionX)
	end

	def setHunterPositionY(positionY)
		return self.setPositionX(positionY)
	end

end