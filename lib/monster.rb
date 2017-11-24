require './lib/player'
class Monster < Player
	def intialize
		super
	end

	def monsterAlive
		return self.playerAlive
	end

	def getMonsterPositionX
		return self.getPositionX
	end

	def getMonsterPositionY
		return self.getPositionY
	end

	def killMonster
		self.setPlayerStatus
	end

	def setMonsterPositionX(positionX)
		return self.setPositionX(positionX)
	end

	def setMonsterPositionY(positionY)
		return self.setPositionX(positionY)
	end

	def reviveMonster
		self.revivePlayer
	end

end